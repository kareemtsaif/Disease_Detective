import 'package:flutter/material.dart';
import 'package:health_guard/core/utils/colors.dart';
import 'package:health_guard/core/widgets/custom_svg.dart';

class CustomProfileOption extends StatelessWidget {
  const CustomProfileOption(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap,
      this.isLogout = false});

  final String icon;
  final String title;
  final VoidCallback onTap;
  final bool isLogout;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: CustomSvg(
        svgPath: icon,
        height: 20,
        width: 20,
        color: isLogout ? Colors.red : Colors.black,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isLogout ? Colors.red : Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: AppColor.bodyColor,
        size: 24,
        
      ),
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
