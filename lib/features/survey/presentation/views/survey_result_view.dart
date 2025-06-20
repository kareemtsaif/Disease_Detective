import 'package:flutter/material.dart';
import 'package:disease_detective/features/survey/presentation/views/widgets/survey_result_view_body.dart';

class SurveyResultView extends StatelessWidget {
  const SurveyResultView({super.key, required this.resultData});
  final dynamic resultData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SurveyResultViewBody(
        resultData: resultData,
      ),
    );
  }
}
