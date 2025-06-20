import 'package:flutter/material.dart';
import 'package:health_guard/core/utils/colors.dart';

class CustomTextButtonAuth extends StatelessWidget {
  const CustomTextButtonAuth(
      {super.key,
      required this.text,
      required this.button,
      required this.onTap});
  final String text;
  final String button;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(
            color: AppColor.subColor,
            fontSize: 18,
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            button,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              color: AppColor.primaryColor,
              fontSize: 20,
              decoration: TextDecoration.underline,
            ),
          ),
        )
      ],
    );
  }
}
