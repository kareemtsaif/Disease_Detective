import 'package:flutter/material.dart';
import 'package:health_guard/core/utils/colors.dart';
import 'package:health_guard/core/utils/images.dart';
import 'package:health_guard/core/utils/strings.dart';
import 'package:health_guard/core/widgets/custom_app_bar.dart';
import 'package:health_guard/features/home/data/static/health_instruction_list.dart';
import 'package:health_guard/features/home/presentation/views/widgets/health_instruction_card.dart';

class DetailsInfoScreen extends StatelessWidget {
  const DetailsInfoScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: AppString.takeCareOfYourHealth),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Center(
                child: Image.asset(AppImage.healthTipOne, height: 180),
              ),
              const SizedBox(height: 40),
              const Text(
                AppString.seasonalAllergies,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColor.bodyColor,
                ),
              ),
              const SizedBox(height: 20),
              HealthInstructionCard(
                title: healthInstruction[0]['title'] as String,
                description: healthInstruction[0]['description'] as String,
                image: healthInstruction[0]['image'] as String,
              ),
              HealthInstructionCard(
                title: healthInstruction[1]['title'] as String,
                description: healthInstruction[1]['description'] as String,
                image: healthInstruction[1]['image'] as String,
              ),
              HealthInstructionCard(
                title: healthInstruction[2]['title'] as String,
                description: healthInstruction[2]['description'] as String,
                image: healthInstruction[2]['image'] as String,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
