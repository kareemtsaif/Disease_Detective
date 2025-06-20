import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvg extends StatelessWidget {
  final String svgPath;
  final Color? color;
  final double? width;
  final double? height;

  const CustomSvg({
    super.key,
    required this.svgPath,
    this.color,
    this.width = 24,
    this.height = 24,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgPath,
      width: width,
      height: height,
      colorFilter:
          color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
    );
  }
}
