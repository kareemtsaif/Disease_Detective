import 'dart:io';

import 'package:flutter/material.dart';
import 'package:disease_detective/features/Diagnostics/presentation/views/widgets/breast_cancer_diagnosis_result_body.dart';

class BreastCancerDiagnosisResultView extends StatelessWidget {
  const BreastCancerDiagnosisResultView({super.key, required File image});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BreastCancerDiagnosisResultBody(),
    );
  }
}
