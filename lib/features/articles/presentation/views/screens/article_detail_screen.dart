import 'package:flutter/material.dart';
import 'package:disease_detective/core/utils/colors.dart';
import 'package:disease_detective/core/widgets/custom_head_title_back_button.dart';
import 'package:disease_detective/features/articles/data/models/article.dart';
import 'package:disease_detective/features/articles/presentation/views/widgets/custom_button_readmore.dart';

class ArticleDetailScreen extends StatelessWidget {
  final Article article;

  const ArticleDetailScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                const SizedBox(height: 24),
                _buildImage(),
                const SizedBox(height: 24),
                _buildOverviewSection(),
                const SizedBox(height: 24),
                _buildRiskSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        CustomHeadTitleBackButton(title: article.title),
        const SizedBox(width: 40), // Balance the layout
      ],
    );
  }

  Widget _buildImage() {
    return Center(
      child: Image.asset(
        article.image,
        height: 200,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: 200,
            color: AppColor.grey,
            child: const Icon(Icons.image, color: AppColor.subColor, size: 50),
          );
        },
      ),
    );
  }

  Widget _buildOverviewSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Overview',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColor.bodyColor,
              ),
            ),
            const Spacer(),
            Text(
              '30 min ago',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        CustomButtonReadmore(
          article: article,
          content: article.content.trimRight(),
        ),
      ],
    );
  }

  Widget _buildRiskSection() {
    if (article.title == 'Breast cancer') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Risk',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColor.bodyColor,
            ),
          ),
          const SizedBox(height: 12),
          article.riskFactors != null && article.riskFactors!.isNotEmpty
              ? Column(
                  children: article.riskFactors!
                      .map((factor) => _buildRiskFactor(
                            factor['title'] ?? '',
                            factor['description'] ?? '',
                          ))
                      .toList(),
                )
              : const Text(
                  'No specific risk factors available for this article.',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColor.subColor,
                  ),
                ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Risk',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColor.bodyColor,
            ),
          ),
          const SizedBox(height: 12),
          CustomButtonReadmore(
            article: article,
            content:
                'Detailed information about risk ${article.title.toLowerCase()}... ',
          ),
        ],
      );
    }
  }

  Widget _buildRiskFactor(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 14, color: Colors.grey[800], height: 1.5),
          children: [
            TextSpan(
              text: '$title ',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: description),
          ],
        ),
      ),
    );
  }
}
