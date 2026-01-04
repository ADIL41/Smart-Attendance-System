import 'package:flutter/material.dart';
import 'package:smart_attandance_system/Screens/sign_up_screen.dart';
import 'package:smart_attandance_system/Theme/colors.dart';
import 'package:smart_attandance_system/Widgets/glass_container.dart';
import 'package:smart_attandance_system/Widgets/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.salem,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Center(
            child: GlassContainer(
              blur: 18,
              borderRadius: 20,
              padding: const EdgeInsets.all(18),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),

                    const Center(
                      child: Icon(
                        Icons.fingerprint,
                        size: 80,
                        color: AppColors.salemLight,
                      ),
                    ),

                    const SizedBox(height: 14),

                    const Center(
                      child: Text(
                        'Smart Attendance',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textWhite,
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    Center(
                      child: Text(
                        'Secure biometric attendance system',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.textSub,
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    const LoginForm(),

                    const SizedBox(height: 25),

                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "Don't have an account? Sign Up",
                          style: TextStyle(
                            color: AppColors.textWhite,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
