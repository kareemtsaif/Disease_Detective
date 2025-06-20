import 'package:flutter/material.dart';
import 'package:health_guard/core/utils/colors.dart';

class CustomSectionHeaderSetting extends StatelessWidget {
  final String title;

  const CustomSectionHeaderSetting({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: isDark ? AppColor.white : Colors.black87,
        ),
      ),
    );
  }
}
