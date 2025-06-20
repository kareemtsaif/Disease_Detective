import 'package:flutter/material.dart';
import 'package:disease_detective/core/utils/colors.dart';

class CustomTextFieldEditProfile extends StatelessWidget {
  const CustomTextFieldEditProfile(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.title});
  final TextEditingController controller;
  final String hintText;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColor.bodyColor,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          cursorColor: Colors.black,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              color: AppColor.subColor,
              fontSize: 16,
            ),
            filled: true,
            fillColor: AppColor.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColor.subColor,
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColor.subColor,
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColor.primaryColor,
                width: 2,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
          ),
          style: const TextStyle(
            fontSize: 16,
            color: AppColor.bodyColor,
          ),
        ),
      ],
    );
  }
}
