import 'package:flutter/material.dart';
import 'package:health_guard/core/utils/colors.dart';
import 'package:health_guard/features/profile/data/models/medical_record_model.dart';

class CustomMedicalRecordCard extends StatelessWidget {
  const CustomMedicalRecordCard({super.key, required this.record, });
  final MedicalRecord record;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColor.grey,
          width: 2,
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColor.grey,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Medical Illustration
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey[100],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                record.image,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Medical Information
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  record.condition,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColor.bodyColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  record.date,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColor.subColor,
                  ),
                ),
              ],
            ),
          ),
          // Arrow Icon
        ],
      ),
    );
  }
}