import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/constants/app_assets.dart';
import 'package:taskati/core/functions/navigations.dart';
import 'package:taskati/core/services/shared_pref.dart';
import 'package:taskati/core/styles/app_colors.dart';
import 'package:taskati/core/widgets/custom_svg_picture.dart';
import 'package:taskati/core/widgets/custom_text_field.dart';
import 'package:taskati/core/widgets/dialogs.dart';
import 'package:taskati/core/widgets/main_button.dart';
import 'package:taskati/core/widgets/tab_button.dart';
import 'package:taskati/features/home/page/home_screen.dart';

// use ImagePicker to pick image from camera or gallery
// extract path from XFile that is returned
// use path to display image using FileImage(File(path))

// XFile(path) ==> ImagePicker
// File(path) ==> dart:io

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  String? path;
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Complete Your Profile')),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            Gap(40),
            Row(children: [Text('Profile Image')]),
            Gap(20),
            Stack(
              children: [
                CircleAvatar(
                  radius: 82,
                  backgroundColor: AppColors.backgroundColor,
                  backgroundImage: path != null
                      ? FileImage(File(path!))
                      : AssetImage(AppAssets.user),
                ),
                if (path != null)
                  Positioned(
                    right: 5,
                    bottom: 5,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          path = null;
                        });
                      },
                      child: CircleAvatar(
                        backgroundColor: AppColors.backgroundColor,
                        child: CustomSvgPicture(path: AppAssets.deleteSvg),
                      ),
                    ),
                  ),
              ],
            ),
            Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TabButton(
                  text: 'From Camera',
                  onPressed: () {
                    uploadImage(ImageSource.camera);
                  },
                ),
                Gap(20),
                TabButton(
                  text: 'From Gallery',
                  onPressed: () {
                    uploadImage(ImageSource.gallery);
                  },
                ),
              ],
            ),
            Gap(40),
            Row(children: [Text('Your Name')]),
            Gap(20),
            CustomTextField(
              controller: nameController,
              hint: 'Enter Your Name',
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(22, 5, 22, 20),
        child: MainButton(
          text: 'Let\'s Start!',
          onPressed: () async {
            if (path != null && nameController.text.isNotEmpty) {
              await SharedPref.setUserInfo(nameController.text, path!);
              await SharedPref.setBool(SharedPref.isUploadedKey, true);
              pushReplacement(context, HomeScreen());
              // navigate to home screen
            } else if (path != null && nameController.text.isEmpty) {
              showErrorDialog(context, 'Please enter your name');
            } else if (path == null && nameController.text.isNotEmpty) {
              showErrorDialog(context, 'Please upload your image');
            } else {
              showErrorDialog(
                context,
                'Please upload your image and enter your name',
              );
            }
          },
        ),
      ),
    );
  }

  Future<void> uploadImage(ImageSource source) async {
    var image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      setState(() {
        path = image.path;
      });
    }
  }
}
