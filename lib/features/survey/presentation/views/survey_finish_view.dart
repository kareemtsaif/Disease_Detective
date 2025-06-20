import 'package:flutter/material.dart';
import 'package:health_guard/features/survey/presentation/views/widgets/survey_finish_view_body.dart';
class SurveyFinishView extends StatelessWidget {
  const SurveyFinishView({super.key, required this.resultData});
final dynamic  resultData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SurveyFinishViewBody(resultData: resultData,),
    );
  }
}
