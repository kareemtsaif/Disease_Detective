import 'package:flutter/material.dart';
import 'package:health_guard/core/utils/colors.dart';

class CustomTextFieldSurvey extends StatelessWidget {
  const CustomTextFieldSurvey({super.key, required this.hintText});
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          cursorColor: AppColor.bodyColor,
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: AppColor.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColor.subColor),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.subColor),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
