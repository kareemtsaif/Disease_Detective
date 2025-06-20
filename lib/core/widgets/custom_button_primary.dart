import 'package:flutter/material.dart';
import 'package:disease_detective/core/utils/colors.dart';

class CustomButtonPrimary extends StatelessWidget {
  const CustomButtonPrimary({
    super.key,
    required this.buttonName,
    required this.onPressed,
  });

  final String buttonName;

  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 343,
      height: 56,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: AppColor.primaryColor,
        onPressed: onPressed,
        child: Text(
          buttonName,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColor.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
      ),
    );
  }
}
