import 'package:flutter/material.dart';
import 'package:health_guard/core/utils/colors.dart';
import 'package:health_guard/core/widgets/custom_svg.dart';
import 'package:health_guard/features/home/data/static/navigation_list.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.white,
        boxShadow: [
          BoxShadow(
            color: AppColor.bodyColor.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: AppColor.white,
        elevation: 0,
        child: SizedBox(
          height: 65,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...navItemList.take(2).map((item) => _buildNavItem(
                svgPath: item.svgPath,
                    label: item.label,
                    index: navItemList.indexOf(item),
                    isActive: currentIndex == navItemList.indexOf(item),
                  )),
              const SizedBox(width: 64),
              ...navItemList.skip(2).map((item) => _buildNavItem(
                svgPath: item.svgPath,
                    label: item.label,
                    index: navItemList.indexOf(item),
                    isActive: currentIndex == navItemList.indexOf(item),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required String svgPath,
    required String label,
    required int index,
    required bool isActive,
  }) {
    return Expanded(
      child: InkWell(
        onTap: () => onTap(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: BoxDecoration(
            color: isActive
                ? AppColor.primaryLight.withOpacity(0.1)
                : AppColor.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: isActive
                      ? AppColor.primaryLight.withOpacity(0.2)
                      : AppColor.transparent,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: _buildIcon(svgPath, isActive)
              ),
              const SizedBox(height: 2),
              Flexible(
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 300),
                  style: TextStyle(
                    color:
                        isActive ? AppColor.primaryLight : AppColor.subColor,
                    fontSize: isActive ? 11 : 10,
                    fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                  ),
                  child: Text(
                    label,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
Widget _buildIcon(String svgPath, bool isActive) {
    final iconSize = isActive ? 24.0 : 22.0;
    final iconColor = isActive ? AppColor.primaryLight : AppColor.subColor;

    return CustomSvg(
      svgPath: svgPath,
      width: iconSize,
      height: iconSize,
      color: iconColor,
    );
  }
