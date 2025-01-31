// import 'package:business_ecomm/features/auth/presentation/pages/login_screen.dart';
// import 'package:business_ecomm/features/auth/presentation/pages/signup_page2.dart';
// import 'package:business_ecomm/features/auth/presentation/pages/phone_login.dart';
import 'package:business_ecomm/features/auth/presentation/pages/login_screen.dart';
import 'package:business_ecomm/features/auth/presentation/pages/signup_page.dart';
import 'package:business_ecomm/features/auth/presentation/pages/signup_page2.dart';
import 'package:business_ecomm/features/home/presentation/pages/home_screen.dart';
import 'package:business_ecomm/splashScreen/presentation/pages/splash_screen.dart';
// import 'package:business_ecomm/features/home/presentation/pages/home_screen.dart';
import 'package:business_ecomm/theme/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Business Ecomm',
      theme: lightMode,
      home: const SignUpScreen(),
      initialRoute: '/splash',
      routes: {
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/register': (context) => const RegistrationForm(),
        '/splash': (context) => const SplashScreen(),
      },
    );
  }
}
