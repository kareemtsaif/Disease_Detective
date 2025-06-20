import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:health_guard/core/utils/colors.dart';
import 'package:health_guard/core/utils/icons.dart';
import 'package:health_guard/core/widgets/custom_svg.dart';

class AnimatedFloatingActionButton extends StatelessWidget {
  final Animation<double> scaleAnimation;
  final Animation<double> rotationAnimation;
  final VoidCallback onPressed;

  const AnimatedFloatingActionButton({
    super.key,
    required this.scaleAnimation,
    required this.rotationAnimation,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([scaleAnimation, rotationAnimation]),
      builder: (context, child) {
        return Transform.scale(
          scale: scaleAnimation.value,
          child: Transform.rotate(
            angle: rotationAnimation.value * 2 * math.pi,
            child: Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColor.primaryLight, AppColor.primaryColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.primaryLight.withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Material(
                color: AppColor.transparent,
                child: MaterialButton(
                  onPressed: () {},
                  shape: const CircleBorder(),
                  padding: EdgeInsets.zero,
                  minWidth: 56,
                  height: 56,
                  color: AppColor.primaryColor,
                  child: const SizedBox(
                    width: 28,
                    height: 28,
                    child:  CustomSvg(
                                  svgPath: AppIcon.scan,
                                  // color: AppColor.white,
                                )
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
