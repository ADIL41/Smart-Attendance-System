import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smart_attandance_system/Screens/location_screen.dart';
import 'package:smart_attandance_system/Theme/colors.dart';
import 'package:smart_attandance_system/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Attandence System',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.salem,
          primary: AppColors.salem,
        ),
        useMaterial3: true,
      ),

      home: const LocationScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
