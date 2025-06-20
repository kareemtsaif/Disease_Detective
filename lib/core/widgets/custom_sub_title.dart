import 'package:flutter/material.dart';
import 'package:disease_detective/core/utils/colors.dart';

class CustomSubTitle extends StatelessWidget {
  const CustomSubTitle({super.key, required this.subtitle});
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Text(
        textAlign: TextAlign.center,
        subtitle,
        style: const TextStyle(
          fontSize: 16,
          color: AppColor.subColor,
          fontWeight: FontWeight.w400,
          height: 0,
        ));
  }
}
