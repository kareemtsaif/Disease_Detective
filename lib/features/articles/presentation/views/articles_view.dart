import 'package:flutter/material.dart';
import 'package:disease_detective/features/articles/presentation/views/widgets/articles_view_body.dart';

class ArticleView extends StatelessWidget {
  const ArticleView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ArticleViewBody(),
    );
  }
}
