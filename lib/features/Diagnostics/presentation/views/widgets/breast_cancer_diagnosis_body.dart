import 'package:flutter/material.dart';
import 'package:health_guard/core/utils/colors.dart';
import 'package:health_guard/core/utils/strings.dart';
import 'package:health_guard/core/widgets/custom_button_primary.dart';
import 'package:health_guard/core/widgets/custom_button_secondary.dart';
import 'package:health_guard/core/widgets/custom_head_title_back_button.dart';
import 'package:health_guard/features/Diagnostics/presentation/views/breast_cancer_diagnosis_result_view.dart';
import 'package:health_guard/features/Diagnostics/presentation/views/widgets/custom_smooth_corner_painter.dart';

class BreastCancerDiagnosisBody extends StatelessWidget {
  const BreastCancerDiagnosisBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 15),
        child: Center(
          child: Column(
            children: [
              const CustomHeadTitleBackButton(title: AppString.xRayInsight),
              const SizedBox(height: 100),
              Stack(
                alignment: Alignment.center,
                children: [
                  CustomPaint(
                    size: const Size(300, 300),
                    painter: CustomSmoothCornerPainter(),
                  ),
                  const Center(
                    child: Text(
                      AppString.putTheXrayHere,
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColor.subColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 2),
              CustomButtonPrimary(
                buttonName: AppString.scan,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        const BreastCancerDiagnosisResultView(),
                  ));
                },
              ),
              const SizedBox(height: 15),
              CustomButtonSecondary(
                buttonName: AppString.uploadAPhoto,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        const BreastCancerDiagnosisResultView(),
                  ));
                },
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
