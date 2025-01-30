import 'package:flutter/material.dart';
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
              // border when unselected
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.circular(12.0),
              ),
              // border when selected
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.secondary),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            initialCountryCode: 'IN',
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
              // border when unselected
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.circular(12.0),
              ),
              // border when selected
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.secondary),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          );
  }
}
