import 'package:flutter/material.dart';
import 'package:health_guard/core/widgets/custom_svg.dart';
import 'custom_switch.dart';

class CustomSwitchTile extends StatelessWidget {
  final String icon;
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitchTile({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading:CustomSvg(
        svgPath: icon,
        color: isDark ? Colors.grey[400] : Colors.grey[600],
        width: 24,
        height: 24,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isDark ? Colors.white : Colors.black87,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: CustomSwitch(
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
