import 'package:flutter/material.dart';

class AppColors {
  static const Color salem = Color(0xFF0A774F);
  static const Color salemLight = Color(0xFF4CAF50);
  static const Color textWhite = Color(0xFFFFFFFF);
  static final Color textSub = textWhite.withValues(alpha: 0.5);
  static final Color white = Colors.white;
}

class AppGradients {
  static const LinearGradient salemBg = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.salem, AppColors.salemLight],
  );
}
