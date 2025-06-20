import 'package:flutter/material.dart';
import 'package:disease_detective/core/utils/colors.dart';
import 'package:disease_detective/features/articles/data/models/article.dart';

class CustomButtonReadmore extends StatelessWidget {
  const CustomButtonReadmore(
      {super.key, required this.article, required this.content});
  final Article article;
  final String content;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey[800],
          height: 1.5,
        ),
        children: [
          TextSpan(text: content),
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: TextButton(
              onPressed: () {
                // Handle "See More" tap
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: const Size(0, 0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text(
                'See More',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryColor,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2.5,
                  decorationColor: AppColor.primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
