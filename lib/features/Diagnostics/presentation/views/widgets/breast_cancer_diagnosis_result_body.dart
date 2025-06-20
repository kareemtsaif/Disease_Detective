import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:disease_detective/core/utils/colors.dart';
import 'package:disease_detective/core/utils/images.dart';
import 'package:disease_detective/core/utils/router.dart';
import 'package:disease_detective/core/utils/strings.dart';
import 'package:disease_detective/core/widgets/custom_button_primary.dart';
import 'package:disease_detective/core/widgets/custom_head_title_back_button.dart';
import 'package:disease_detective/core/widgets/custom_image.dart';

class BreastCancerDiagnosisResultBody extends StatelessWidget {
  const BreastCancerDiagnosisResultBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 15),
        child: Center(
          child: Column(
            children: [
              const CustomHeadTitleBackButton(title: AppString.xRayResults),
              const SizedBox(height: 30),
              const CustomImage(image: AppImage.xRayResults),
              const SizedBox(height: 30),
              const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(Icons.error_outline, color: AppColor.red, size: 30),
                SizedBox(width: 5),
                Text(
                  AppString.breastCancer,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ]),
              const SizedBox(height: 10),
              const SizedBox(
                width: 340,
                child: Text(
                  textAlign: TextAlign.center,
                  AppString.xRayResultsDescription,
                  style: TextStyle(
                    color: AppColor.subColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const Spacer(flex: 2),
              CustomButtonPrimary(
                  onPressed: () {
                    GoRouter.of(context).go(AppRouter.kHomeView);
                  },
                  buttonName: AppString.continueToHome),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
