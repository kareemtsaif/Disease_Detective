import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:health_guard/core/utils/router.dart';
import 'package:health_guard/core/utils/strings.dart';
import 'package:health_guard/core/widgets/custom_head_title.dart';
import 'package:health_guard/features/Diagnostics/presentation/views/breast_cancer_diagnosis_view.dart';
import 'package:health_guard/features/Diagnostics/presentation/views/widgets/custom_button_diagnosis.dart';

class DiseaseDetectionsBody extends StatelessWidget {
  const DiseaseDetectionsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 15),
      child: Center(
        child: Column(
          children: [
            const CustomHeadTitle(title: AppString.myDiagnosis),
            const SizedBox(height: 35),
            CustomButtonDiagnosis(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const BreastCancerDiagnosisView(),
                ));
              },
              buttonName: AppString.breastCancer,
            ),
            CustomButtonDiagnosis(
              onPressed: () {
                GoRouter.of(context).go(AppRouter.kDiabetesView);
                
                
              },
              buttonName: "Diabetes",
            ),
          ],
        ),
      ),
    ));
  }
}
