// import 'package:business_ecomm/theme/colors.dart';
import 'dart:developer';

import 'package:business_ecomm/features/auth/presentation/components/my_button.dart';
import 'package:business_ecomm/features/auth/presentation/components/my_text_field.dart';
import 'package:business_ecomm/features/auth/presentation/pages/login_screen.dart';
import 'package:business_ecomm/utility/snackbar_helper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  void validForm() {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty ||
        nameController.text.isEmpty ||
        phoneNumberController.text.isEmpty) {
      SnackBarHelper.showErrorSnackBar('Please fill all the details');
      return;
    } else if (passwordController.text != confirmPasswordController.text) {
      SnackBarHelper.showErrorSnackBar("Passwords do not match");
      return;
    } else if (nameController.text.length <= 3 ||
        nameController.text.length > 30) {
      SnackBarHelper.showErrorSnackBar(
          "Name should contain atleast three characters and less than thirty characters");
      return;
    }
  }

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
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Step 1/2",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.userPlus,
                        color: Theme.of(context).colorScheme.primary,
                        size: 60,
                      ),
                      Text(
                        "SignUp",
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
                          controller: nameController,
                          labelText: 'Name',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                        child: MyTextField(
                          isEnabled: false,
                          showCountryCode: true,
                          controller: phoneNumberController,
                          labelText: 'Phone Number',
                          keyboardType: TextInputType.numberWithOptions(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
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
                          isEnabled: false,
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
                        child: MyTextField(
                          isEnabled: false,
                          showCountryCode: false,
                          controller: confirmPasswordController,
                          labelText: 'Confirm Password',
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
                              validForm();
                              checkEmail();
                            },
                            text: "Sign Up"),
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
                                  text: "Already have an account?",
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: 15,
                                  ),
                                ),
                                TextSpan(
                                  text: " Login",
                                  style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen(),
                                        ),
                                      );
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
          ],
        ),
      ),
    );
  }
}
