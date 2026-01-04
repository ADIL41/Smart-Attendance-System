import 'package:flutter/material.dart';
import 'package:smart_attandance_system/Theme/colors.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Icon(Icons.fingerprint, size: 80, color: AppColors.salemLight),
        ),
        const SizedBox(height: 10),
        const Center(
          child: Text(
            'Create Account',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: AppColors.textWhite,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Center(
          child: Text(
            'Sign up to enable smart tracking and biometric attendance.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: AppColors.textSub),
          ),
        ),
      ],
    );
  }
}
