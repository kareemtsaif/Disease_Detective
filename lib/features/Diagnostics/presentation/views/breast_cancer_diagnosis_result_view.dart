import 'package:flutter/material.dart';
import 'package:health_guard/features/Diagnostics/presentation/views/widgets/breast_cancer_diagnosis_result_body.dart';

class BreastCancerDiagnosisResultView extends StatelessWidget {
  const BreastCancerDiagnosisResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BreastCancerDiagnosisResultBody(),
    );
  }
}
