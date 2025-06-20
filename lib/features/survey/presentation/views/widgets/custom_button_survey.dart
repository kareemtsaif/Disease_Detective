import 'package:flutter/material.dart';
import 'package:health_guard/core/utils/colors.dart';

class CustomButtonSurvey extends StatelessWidget {
  const CustomButtonSurvey(
      {super.key, required this.buttonName, required this.onPressed});
  final String buttonName;

  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 343,
      height: 56,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColor.subColor),
          borderRadius: BorderRadius.circular(12),
        ),
        // color: AppColor.primaryColor,
        onPressed: onPressed,
        child: Text(
          buttonName,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColor.bodyColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
      ),
    );
  }
}
