import 'package:flutter/material.dart';
import 'package:health_guard/core/utils/colors.dart';
import 'package:health_guard/core/utils/strings.dart';
import 'package:health_guard/features/home/data/static/recommended_diagnoses_list.dart';
import 'package:health_guard/features/home/presentation/views/screens/recommended_screen.dart';
import 'package:health_guard/features/home/presentation/views/widgets/custom_diagnoses_card.dart';

class RecommendedDiagnosesSection extends StatelessWidget {
  const RecommendedDiagnosesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              AppString.recommendedDiagnoses,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColor.bodyColor,
              ),
            ),
            TextButton(
              onPressed: () => (
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const RecommendedView(),
                ))
              ),
              child: const Text(
                AppString.viewAll,
                style: TextStyle(
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2.5,
                  decorationColor: AppColor.primaryColor,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 180,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final diagnoses = recommendedDiagnoses[index];
              return CustomDiagnosesCard(
                title: diagnoses['title'] as String,
                description: diagnoses['description'] as String,
                image: diagnoses['image'] as String,
              );
            },
          ),
        ),
      ],
    );
  }
}

