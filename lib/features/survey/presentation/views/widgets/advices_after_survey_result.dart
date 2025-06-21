import 'package:flutter/material.dart';
import 'package:disease_detective/core/utils/colors.dart';

class AdvicesAfterSurveyResult extends StatelessWidget {
  const AdvicesAfterSurveyResult(
      {super.key, required this.number, required this.advice});
  final String number;
  final dynamic advice;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // تأكد أن العنصر يأخذ كامل العرض
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // حتى يبدأ النص من الأعلى
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: const Color(0xFF03669F),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              number,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              advice,
              style: const TextStyle(
                color: Color(0xFF8A8A8A),
                fontSize: 16,
                height: 1.4,
              ),
              softWrap: true,
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    );
  }
}
