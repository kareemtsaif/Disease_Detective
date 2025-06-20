import 'package:flutter/material.dart';
import 'package:health_guard/core/utils/colors.dart';

class CustomHeadTitle extends StatelessWidget {
  const CustomHeadTitle(
      {super.key,
      required this.title,
      this.size = 20,
      this.fontWeight = FontWeight.w600,
      this.textAlign = TextAlign.center});
  final String title;
  final double? size;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      title,
      style: TextStyle(
        fontSize: size,
        color: AppColor.bodyColor,
        fontWeight: FontWeight.w600,
        height: 0,
      ),
    );
  }
}
