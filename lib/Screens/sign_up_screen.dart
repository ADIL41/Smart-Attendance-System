import 'package:flutter/material.dart';
import 'package:smart_attandance_system/Theme/colors.dart';

import '../widgets/glass_container.dart';
import '../widgets/header_section.dart';
import '../widgets/login_link.dart';
import '../widgets/signup_form.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                  children: const [
                    SizedBox(height: 10),
                    HeaderSection(),
                    SizedBox(height: 10),
                    SignUpForm(),
                    SizedBox(height: 30),
                    LoginLink(),
                    SizedBox(height: 25),
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
