import 'package:flutter/material.dart';

import 'package:health_guard/features/onBoarding/presentation/views/widgets/on_boarding_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: OnBoardingViewBody(),
    );
  }
}
