import 'package:business_ecomm/features/auth/presentation/components/my_button.dart';
import 'package:business_ecomm/features/auth/presentation/components/my_text_field.dart';
import 'package:business_ecomm/features/auth/presentation/pages/login_screen.dart';
import 'package:flutter/material.dart';

class PhoneLoginScreen extends StatefulWidget {
  const PhoneLoginScreen({super.key});

  @override
  State<PhoneLoginScreen> createState() => _PhoneLoginScreenState();
}

class _PhoneLoginScreenState extends State<PhoneLoginScreen> {
  TextEditingController phoneNumberController = TextEditingController();
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: MyTextField(
                    controller: phoneNumberController,
                    labelText: "PhoneNumber",
                    showCountryCode: true,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: MyButton(onTap: () {}, text: "Send Otp"),
                ),
                Divider(
                  color: Theme.of(context).colorScheme.primary,
                  indent: 50,
                  endIndent: 50,
                  thickness: 2,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Login using Email and Password",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 15,
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
