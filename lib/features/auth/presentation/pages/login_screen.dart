// import 'package:business_ecomm/theme/colors.dart';
import 'dart:developer';

import 'package:business_ecomm/features/auth/presentation/components/my_button.dart';
import 'package:business_ecomm/features/auth/presentation/components/my_text_field.dart';
import 'package:business_ecomm/utility/snackbar_helper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    );
    return emailRegex.hasMatch(email);
  }

  void checkEmail() {
    String email = emailController.text;
    if (!isValidEmail(email)) {
      return SnackBarHelper.showErrorSnackBar('Enter a valid email');
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Transform.translate(
                  offset: Offset(-20, 0),
                  child: Icon(
                    Icons.login,
                    color: Theme.of(context).colorScheme.primary,
                    size: 80,
                  ),
                ),
                Text(
                  "Login",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(
                  thickness: 2,
                  color: Theme.of(context).colorScheme.primary,
                  indent: 20,
                  endIndent: 20,
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: MyTextField(
                    isEnabled: false,
                    showCountryCode: false,
                    controller: emailController,
                    labelText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: MyTextField(
                    isEnabled: true,

                    showCountryCode: false,
                    controller: passwordController,
                    labelText: 'Password',
                    obscureText: true,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: MyButton(
                    onTap: () {
                      log('Btn clicked');
                      checkEmail();
                    },
                    text: "Login",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Don't have an account?",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 15,
                            ),
                          ),
                          TextSpan(
                            text: " Sign up",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, '/signup');
                                log('Txt Btn clicked');
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
