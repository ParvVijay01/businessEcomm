import 'package:business_ecomm/features/auth/presentation/pages/login_screen.dart';
import 'package:business_ecomm/features/auth/presentation/pages/phone_login.dart';
import 'package:business_ecomm/features/auth/presentation/pages/signup_page.dart';
import 'package:business_ecomm/features/home/presentation/pages/home_screen.dart';
import 'package:business_ecomm/theme/light_mode.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Business Ecomm',
      theme: lightMode,
      home: const HomeScreen(),
    );
  }
}
