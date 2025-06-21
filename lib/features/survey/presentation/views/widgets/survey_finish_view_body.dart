import 'package:flutter/material.dart';
import 'package:disease_detective/core/utils/images.dart';
import 'package:disease_detective/core/utils/strings.dart';
import 'package:disease_detective/core/widgets/custom_button_primary.dart';
import 'package:disease_detective/core/widgets/custom_head_title.dart';
import 'package:disease_detective/core/widgets/custom_image.dart';
import 'package:disease_detective/core/widgets/custom_sub_title.dart';
import 'package:disease_detective/features/survey/presentation/views/survey_result_view.dart';

class SurveyFinishViewBody extends StatelessWidget {
  const SurveyFinishViewBody({super.key, required this.resultData});
  final dynamic resultData;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 15),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const CustomHeadTitle(title: 'Survey Finished'),
              const SizedBox(height: 16),
              const CustomSubTitle(subtitle: AppString.subTitleSurveyFinish),
              const Spacer(flex: 1),
              const CustomImage(image: AppImage.chatBot),
              const Spacer(flex: 2),
              CustomButtonPrimary(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SurveyResultView(
                      resultData: resultData,
                    ),
                  ));
                },
                buttonName: AppString.viewResult,
              ),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
