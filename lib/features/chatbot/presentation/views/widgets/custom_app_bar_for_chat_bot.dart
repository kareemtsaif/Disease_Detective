import 'package:flutter/material.dart';
import 'package:disease_detective/core/utils/colors.dart';
import 'package:disease_detective/core/utils/images.dart' show AppImage;
import 'package:disease_detective/core/utils/strings.dart';

class CustomAppBarForChatBot extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarForChatBot({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      backgroundColor: AppColor.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColor.grey,
                width: 2.0,
              ),
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              borderRadius: BorderRadius.circular(20),
              child: const Icon(
                Icons.arrow_back,
                color: AppColor.subColor,
                size: 20,
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                AppImage.robot,
                width: 32,
                height: 32,
              ),
              const SizedBox(width: 8),
              const Text(
                AppString.chatbot,
                style: TextStyle(
                  color: AppColor.bodyColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColor.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColor.grey,
                width: 2.0,
              ),
            ),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(20),
              child: const Icon(
                Icons.add,
                color: AppColor.subColor,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
