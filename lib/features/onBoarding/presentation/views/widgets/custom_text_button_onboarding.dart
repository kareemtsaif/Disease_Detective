import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:disease_detective/core/utils/router.dart';
import 'package:disease_detective/core/utils/strings.dart';
import 'package:disease_detective/core/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomTextButtonOnboarding extends StatelessWidget {
  const CustomTextButtonOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(
          height: 100,
        ),
        TextButton(
          onPressed: () async {
            final prefs = await SharedPreferences.getInstance();
            await prefs.setBool('seenOnboarding', true);
            context.go(AppRouter.kSignInView);
          },
          child: const Text(
            AppString.skip,
            style: TextStyle(
              color: AppColor.primaryColor,
              fontSize: 20,
              decoration: TextDecoration.underline,
              decorationThickness: 2.5,
              decorationColor: AppColor.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
