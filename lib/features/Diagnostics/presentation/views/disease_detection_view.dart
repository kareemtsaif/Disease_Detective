import 'package:flutter/material.dart';
import 'package:disease_detective/features/Diagnostics/presentation/views/widgets/disease_detection_body.dart';

class DiseaseDetectionView extends StatelessWidget {
  const DiseaseDetectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DiseaseDetectionsBody(),
    );
  }
}
