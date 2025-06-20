import 'package:flutter/material.dart';
import 'package:disease_detective/core/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.headTextField,
    required this.icon,
    this.obscureText = false,
    this.suffixIcon,
    required this.keyboard,
    this.controller,
    this.validator,
  });
  final String hintText;
  final String headTextField;
  final IconData icon;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType keyboard;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              headTextField,
              style: const TextStyle(
                color: AppColor.bodyColor,
                fontWeight: FontWeight.w600,
                fontSize: 16,
                height: 0,
                letterSpacing: -0.28,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          validator: validator,
          controller: controller,
          keyboardType: keyboard,
          obscureText: obscureText,
          cursorColor: AppColor.bodyColor,
          decoration: InputDecoration(
              prefixIcon: Icon(
                icon,
                color: AppColor.subColor,
              ),
              suffixIcon: suffixIcon,
              hintText: hintText,
              filled: true,
              fillColor: AppColor.white,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColor.subColor),
                  borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColor.subColor),
                  borderRadius: BorderRadius.circular(10))),
        ),
      ],
    );
  }
}
