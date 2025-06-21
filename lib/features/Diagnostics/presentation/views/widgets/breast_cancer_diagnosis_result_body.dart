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
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                    size: 60, // أيقونة خضراء كبيرة
                  ),
                  SizedBox(width: 10),
                  Text(
                    "You Are Healthy!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 28, // نص كبير
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  textAlign: TextAlign.center,
                  "Congratulations! No signs of Skin Cancer were detected in your scan. Stay healthy and keep taking care of yourself. We are always here for your peace of mind.",
                  style: TextStyle(
                    color: AppColor.subColor,
                    fontSize: 20, // نص أكبر
                    fontWeight: FontWeight.w500,
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
