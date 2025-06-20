import 'package:flutter/material.dart';
import 'package:health_guard/features/articles/presentation/views/widgets/articles_view_body.dart';

class ArticleView extends StatelessWidget {
  const ArticleView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:ArticleViewBody(),
    );
  }
}
