import 'package:flutter/material.dart';
import 'package:disease_detective/core/utils/strings.dart';
import 'package:disease_detective/core/widgets/custom_app_bar.dart';
import 'package:disease_detective/features/home/data/static/recommended_diagnoses_list.dart';
import 'package:disease_detective/features/home/presentation/views/widgets/custom_diagnoses_card.dart';

class RecommendedView extends StatelessWidget {
  const RecommendedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppString.recommended,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 20,
            childAspectRatio: 0.8,
          ),
          itemCount: recommendedDiagnoses.length,
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
    );
  }
}
