import 'package:flutter/material.dart';
import 'package:disease_detective/features/survey/presentation/views/widgets/choose_view_body.dart';

class ChooseView extends StatelessWidget {
  const ChooseView({super.key});

  @override
  Widget build(BuildContext context) {
    // log( 'Token is: $token');
    return const Scaffold(
      body: ChooseViewBody(),
    );
  }
}
