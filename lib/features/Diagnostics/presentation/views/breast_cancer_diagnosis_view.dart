import 'package:flutter/material.dart';
import 'package:disease_detective/features/Diagnostics/presentation/views/widgets/breast_cancer_diagnosis_body.dart';

class BreastCancerDiagnosisView extends StatelessWidget {
  const BreastCancerDiagnosisView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BreastCancerDiagnosisBody(),
    );
  }
}
