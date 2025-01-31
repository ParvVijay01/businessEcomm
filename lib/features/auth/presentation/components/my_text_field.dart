import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final bool showCountryCode;
  final Function(String, String)? onPhoneChanged;

  const MyTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.obscureText,
    this.keyboardType,
    required this.showCountryCode,
    this.onPhoneChanged,
  });

  @override
  Widget build(BuildContext context) {
    return showCountryCode
        ? IntlPhoneField(
            controller: controller,
            decoration: InputDecoration(
              labelText: labelText,
              labelStyle: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.circular(12.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.secondary),
                borderRadius: BorderRadius.circular(12.0),
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            ),
            initialCountryCode: 'IN',
            dropdownIcon: Icon(Icons.arrow_drop_down, color: Colors.black),
            flagsButtonPadding: EdgeInsets.only(left: 8),
            disableLengthCheck: true, // Avoids showing max length validation
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly, // Allows only numbers
              LengthLimitingTextInputFormatter(10), // Limits input to 10 digits
            ],
            onChanged: (phone) {
              if (onPhoneChanged != null) {
                onPhoneChanged!(phone.completeNumber, phone.countryCode);
              }
            },
          )
        : TextField(
            controller: controller,
            obscureText: obscureText ?? false,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              labelText: labelText,
              labelStyle: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.circular(12.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.secondary),
                borderRadius: BorderRadius.circular(12.0),
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            ),
          );
  }
}
