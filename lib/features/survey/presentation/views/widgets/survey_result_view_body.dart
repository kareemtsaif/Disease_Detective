import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:disease_detective/core/utils/images.dart';
import 'package:disease_detective/core/utils/strings.dart';
import 'package:disease_detective/core/widgets/custom_button_primary.dart';
import 'package:disease_detective/core/widgets/custom_head_title.dart';
import 'package:disease_detective/core/widgets/custom_image.dart';
import 'package:disease_detective/features/survey/presentation/views/widgets/advices_after_survey_result.dart';

class SurveyResultViewBody extends StatelessWidget {
  const SurveyResultViewBody({super.key, required this.resultData});
  final dynamic resultData;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 15),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CustomHeadTitle(title: AppString.surveyResults),
            const SizedBox(height: 50),
            const CustomImage(image: AppImage.surveyResults),
            const SizedBox(height: 60),
            SizedBox(
              width: 360,
              child: CustomHeadTitle(
                title: resultData['result'],
                size: 16,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(height: 30),
            AdvicesAfterSurveyResult(
              number: "1",
              advice: resultData['advice1'],
            ),
            const SizedBox(height: 30),
            AdvicesAfterSurveyResult(
              number: "2",
              advice: resultData['advice2'],
            ),
            const SizedBox(height: 30),
            AdvicesAfterSurveyResult(
              number: "3",
              advice: resultData['advice3'],
            ),
            const SizedBox(height: 40),
            CustomButtonPrimary(
              onPressed: () {
                GoRouter.of(context).go('/');
              },
              buttonName: AppString.continueToHome,
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    ));
  }
}
