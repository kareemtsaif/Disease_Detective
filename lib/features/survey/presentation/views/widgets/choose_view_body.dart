
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:health_guard/core/utils/images.dart';
import 'package:health_guard/core/utils/router.dart';
import 'package:health_guard/core/utils/strings.dart';
import 'package:health_guard/core/widgets/custom_button_primary.dart';
import 'package:health_guard/core/widgets/custom_head_title.dart';
import 'package:health_guard/core/widgets/custom_image.dart';
import 'package:health_guard/core/widgets/custom_sub_title.dart';
import 'package:health_guard/features/survey/presentation/views/survey_view.dart';
import 'package:health_guard/core/widgets/custom_button_secondary.dart';

class ChooseViewBody extends StatelessWidget {
  const ChooseViewBody({super.key});

  @override

  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 15),
        child: Column(
          children: [
            const SizedBox(
                width: double.infinity,
                child: CustomHeadTitle(title: AppString.letBeginYourHealth)),
            const SizedBox(height: 15),
            const CustomSubTitle(subtitle: AppString.subTitleChoose),
            const Spacer(flex: 2),
            const CustomImage(image: AppImage.choose),
            const Spacer(flex: 3),
            CustomButtonPrimary(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SurveyView(),
                ));
              },
              buttonName: AppString.diagnosisOptions,
            ),
            const SizedBox(height: 15),
            CustomButtonSecondary(
              onPressed: () {
                GoRouter.of(context).go(AppRouter.kDiseaseDetectionView);
              },
              buttonName: AppString.diseaseDetection,
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
