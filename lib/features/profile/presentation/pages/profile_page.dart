import 'dart:io';

import 'package:business_ecomm/features/auth/presentation/components/my_text_field.dart';
import 'package:business_ecomm/features/home/presentation/components/drawer.dart';
import 'package:business_ecomm/features/profile/presentation/components/about_text_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;
  TextEditingController aboutController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        drawer: CustomDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Profile Picture and Logo (Centered)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: _pickImage,
                      child: CircleAvatar(
                        radius: 100,
                        backgroundColor: Theme.of(context).colorScheme.tertiary,
                        backgroundImage:
                            _image != null ? FileImage(_image!) : null,
                        child: _image == null
                            ? Icon(
                                Icons.add_a_photo,
                                color: Colors.black,
                                size: 60,
                              )
                            : null,
                      ),
                    ),
                  ],
                ),
              ),

              // Rest of the content aligned to start
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 3),
                      child: Text(
                        "About",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    AboutTextField(
                      controller: aboutController,
                      hintText: "Tell us about your Business...",
                      maxLines: null,
                      minLines: 5,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 3),
                      child: Text(
                        "Phone Number",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    MyTextField(
                      isEnabled: true,
                      controller: phoneController,
                      hintText: 'Phone Number',
                      showCountryCode: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 3),
                      child: Text(
                        "Name",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    MyTextField(
                      isEnabled: false,
                      showCountryCode: false,
                      hintText: "Name",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
