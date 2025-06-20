import 'package:flutter/material.dart';
import 'package:health_guard/core/utils/colors.dart';
import 'package:health_guard/core/widgets/custom_svg.dart';

class CustomNavigationTile extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;
  final bool isDestructive;

  const CustomNavigationTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap,
      this.isDestructive = false});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: CustomSvg(
        svgPath: icon,
        color: isDestructive
            ? AppColor.red
            : (isDark ? Colors.grey[400] : Colors.grey[600]),
        // width: 24,
        // height: 24,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isDestructive
              ? Colors.red
              : (isDark ? Colors.white : Colors.black87),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Icon(
        Icons.chevron_right,
        color: isDark ? Colors.grey[500] : Colors.grey[400],
        size: 20,
      ),
      onTap: onTap,
    );
  }
}
