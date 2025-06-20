import 'package:flutter/material.dart';
import 'package:disease_detective/core/utils/colors.dart';
import 'package:disease_detective/core/utils/strings.dart';
import 'package:disease_detective/features/home/data/static/tips_list.dart';
import 'package:disease_detective/features/home/presentation/views/screens/details_info_screen.dart';
import 'package:disease_detective/features/home/presentation/views/widgets/custom_diagnoses_card.dart';

class HealthTipsSection extends StatelessWidget {
  const HealthTipsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          AppString.takeCareOfYourHealth,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColor.bodyColor,
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 260,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.horizontal,
            itemCount: tips.length,
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final tip = tips[index];

              if (tip['title'] == 'Seasonal allergies or COVID-19') {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailsInfoScreen(),
                      ),
                    );
                  },
                  child: CustomDiagnosesCard(
                    title: tip['title'] as String,
                    description: tip['description'] as String,
                    image: tip['image'] as String,
                  ),
                );
              } else {
                return CustomDiagnosesCard(
                  title: tip['title'] as String,
                  description: tip['description'] as String,
                  image: tip['image'] as String,
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
