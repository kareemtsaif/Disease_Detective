import 'package:flutter/material.dart';
import 'package:disease_detective/core/utils/colors.dart';
import 'package:disease_detective/core/utils/images.dart';
import 'package:disease_detective/core/utils/strings.dart';
import 'package:disease_detective/features/survey/presentation/views/choose_view.dart';

class HealthAssessmentCard extends StatelessWidget {
  const HealthAssessmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    // log('Token is: $token', name: token);
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: AppColor.lightBlue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  AppString.assessmentCardDescription,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColor.bodyColor,
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChooseView()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryColor,
                    foregroundColor: AppColor.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    AppString.start,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 15),
          Container(
            width: 180,
            height: 150,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImage.assessmentCard),
                fit: BoxFit.fill,
              ),
            ),
          )
        ],
      ),
    );
  }
}
