import 'dart:io';

import 'package:business_ecomm/features/auth/presentation/components/my_button.dart';
import 'package:business_ecomm/features/auth/presentation/components/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  File? _image;
  TextEditingController companyNameController = TextEditingController();
  TextEditingController companyNumberController = TextEditingController();
  TextEditingController companyAddressController = TextEditingController();
  TextEditingController gstNumberController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top aligned text
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  Text(
                    'Step 2/2',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "Registration Form",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Icon(
                    Icons.app_registration,
                    size: 60,
                    color: Theme.of(context).colorScheme.primary,
                  )
                ],
              ),
            ),
            // Center aligned widgets
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: _pickImage,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor:
                              Theme.of(context).colorScheme.tertiary,
                          backgroundImage:
                              _image != null ? FileImage(_image!) : null,
                          child: _image == null
                              ? Icon(
                                  Icons.add_a_photo,
                                  color: Colors.black,
                                )
                              : null,
                        ),
                      ),
                      Text(
                        "Logo",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                        child: MyTextField(
                          controller: companyNameController,
                          labelText: "Company Name",
                          showCountryCode: false,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                        child: MyTextField(
                          controller: companyNumberController,
                          labelText: "Company Number",
                          showCountryCode: true,
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                        child: MyTextField(
                          controller: companyAddressController,
                          labelText: "Company Address",
                          showCountryCode: false,
                          keyboardType: TextInputType.streetAddress,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                        child: MyTextField(
                          controller: categoryController,
                          labelText: "Business Category",
                          showCountryCode: false,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                        child: MyTextField(
                          controller: gstNumberController,
                          labelText: "GST Number",
                          showCountryCode: false,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                        child: MyButton(onTap: () {}, text: "Register"),
                      )
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
