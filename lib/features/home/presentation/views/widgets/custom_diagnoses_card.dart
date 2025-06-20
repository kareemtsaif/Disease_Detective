import 'package:flutter/material.dart';
import 'package:disease_detective/core/utils/colors.dart';

class CustomDiagnosesCard extends StatelessWidget {
  const CustomDiagnosesCard({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });
  final String title;
  final String description;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 200,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColor.grey, // Colored border
          width: 2.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
              child: Image.asset(
                image,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // const SizedBox(height: 12),

          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColor.bodyColor,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Expanded(
                    child: Text(
                      description,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColor.subColor,
                        height: 1.3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
