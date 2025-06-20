import 'package:flutter/material.dart';
import 'package:disease_detective/core/utils/colors.dart';

class CustomButtonDiagnosis extends StatelessWidget {
  const CustomButtonDiagnosis(
      {super.key, required this.onPressed, required this.buttonName});
  final String buttonName;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
          color: AppColor.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: AppColor.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                buttonName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColor.bodyColor,
                ),
              ),
              const Icon(Icons.arrow_forward_ios, color: AppColor.subColor),
            ],
          ),
        ),
        const SizedBox(height: 25)
      ],
    );
  }
}
