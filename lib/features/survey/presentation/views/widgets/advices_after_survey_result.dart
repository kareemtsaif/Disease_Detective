import 'package:flutter/material.dart';
import 'package:disease_detective/core/utils/colors.dart';

class AdvicesAfterSurveyResult extends StatelessWidget {
  const AdvicesAfterSurveyResult(
      {super.key, required this.number, required this.advice});
  final String number;
  final dynamic advice;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 14,
          backgroundColor: AppColor.primaryColor,
          child: Text(
            number,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColor.white,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(width: 15),
        SizedBox(
          width: 325,
          child: Text(
            advice,
            style: const TextStyle(
              color: AppColor.subColor,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    );
  }
}
