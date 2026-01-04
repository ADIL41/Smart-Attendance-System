import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:smart_attandance_system/Screens/location_screen.dart';
import 'package:smart_attandance_system/Theme/colors.dart';
import 'package:smart_attandance_system/Widgets/glass_container.dart';

class BiometricScreen extends StatefulWidget {
  const BiometricScreen({super.key});

  @override
  State<BiometricScreen> createState() => _BiometricScreenState();
}

class _BiometricScreenState extends State<BiometricScreen> {
  final LocalAuthentication _auth = LocalAuthentication();
  bool _isChecking = false;
  String _status = 'Please verify your identity';

  @override
  void initState() {
    super.initState();
    _startBiometricFlow();
  }

  Future<void> _startBiometricFlow() async {
    setState(() {
      _isChecking = true;
      _status = 'Checking device support...';
    });

    try {
      final bool isSupported = await _auth.isDeviceSupported();
      final bool canCheck = await _auth.canCheckBiometrics;

      if (!isSupported || !canCheck) {
        setState(() {
          _isChecking = false;
          _status = 'Biometric authentication is not available on this device.';
        });
        return;
      }

      await _authenticate();
    } catch (e) {
      setState(() {
        _isChecking = false;
        _status = 'Biometric check failed: $e';
      });
    }
  }

  Future<void> _authenticate() async {
    setState(() {
      _isChecking = true;
      _status = 'Waiting for biometric verification...';
    });

    try {
      final bool didAuthenticate = await _auth.authenticate(
        localizedReason: 'Verify to access attendance marking',
        biometricOnly: false,
      );

      if (!mounted) return;

      if (didAuthenticate) {
        setState(() {
          _status = 'Verified successfully';
          _isChecking = false;
        });

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LocationScreen()),
        );
      } else {
        setState(() {
          _isChecking = false;
          _status = 'Authentication failed. Please try again.';
        });
      }
    } on LocalAuthException catch (e) {
      if (!mounted) return;
      setState(() {
        _isChecking = false;
        _status = 'Authentication failed: $e';
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isChecking = false;
        _status = 'Unexpected error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.salem,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: GlassContainer(
              blur: 18,
              borderRadius: 20,
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.fingerprint,
                    size: 90,
                    color: AppColors.salemLight,
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    textAlign: TextAlign.center,
                    'Biometric Verification',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textWhite,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _status,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: AppColors.textSub),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton.icon(
                      onPressed: _isChecking ? null : _authenticate,
                      icon: const Icon(Icons.fingerprint),
                      label: Text(
                        _isChecking ? 'Verifying...' : 'Verify with biometrics',
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.salemLight,
                        foregroundColor: AppColors.textWhite,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: _isChecking ? null : _startBiometricFlow,
                    child: const Text(
                      'Retry',
                      style: TextStyle(color: AppColors.textWhite),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
