import 'package:flutter/material.dart';
import 'package:disease_detective/core/utils/colors.dart';
import 'package:disease_detective/core/utils/strings.dart';
import 'package:disease_detective/core/widgets/custom_app_bar.dart';
import 'package:disease_detective/features/profile/presentation/views/widgets/custom_profile_image.dart';
import 'package:disease_detective/features/profile/presentation/views/widgets/custom_text_field_edit_profile.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: AppString.editProfile),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const CustomProfileImage(),
              const SizedBox(height: 40),
              CustomTextFieldEditProfile(
                controller: nameController,
                hintText: AppString.enterYourName,
                title: AppString.name,
              ),
              const SizedBox(height: 24),
              // Email Field
              CustomTextFieldEditProfile(
                controller: emailController,
                hintText: AppString.enterYourEmail,
                title: AppString.email,
              ),
              const SizedBox(height: 90),
              // Save Changes Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: saveChanges,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryColor,
                    foregroundColor: AppColor.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    AppString.saveChanges,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
  }

  void saveChanges() {
    final name = nameController.text.trim();
    final email = emailController.text.trim();

    // Check if at least one field has data
    if (name.isEmpty && email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill at least one field'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (email.isNotEmpty &&
        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid email address'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Create success message based on what was filled
    String successMessage = '';
    if (name.isNotEmpty && email.isNotEmpty) {
      successMessage = 'Name and email saved successfully!';
    } else if (name.isNotEmpty) {
      successMessage = 'Name saved successfully!';
    } else if (email.isNotEmpty) {
      successMessage = 'Email saved successfully!';
    }

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(successMessage),
        backgroundColor: Colors.green,
      ),
    );

    // Navigate back
    Navigator.pop(context);
  }
}
