import 'package:flutter/material.dart';
import 'package:disease_detective/features/survey/presentation/views/widgets/survey_view_body.dart';

class SurveyView extends StatelessWidget {
  const SurveyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SurveyViewBody(
        currentIndex: 0,
      ),
    );
  }
}
