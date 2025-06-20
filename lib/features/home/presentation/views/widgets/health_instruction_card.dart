import 'package:flutter/material.dart';
import 'package:disease_detective/core/utils/colors.dart';

class HealthInstructionCard extends StatelessWidget {
  final String title;
  final String description;

  final String image;

  const HealthInstructionCard({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(image,
                  width: 100, height: 100, fit: BoxFit.cover)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColor.bodyColor),
                ),
                const SizedBox(height: 4),
                Text(description,
                    style: const TextStyle(
                        fontSize: 12, color: AppColor.subColor)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
