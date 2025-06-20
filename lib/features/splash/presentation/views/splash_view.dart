import 'package:flutter/material.dart';
import 'package:disease_detective/core/utils/colors.dart';
import 'package:disease_detective/features/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.primaryColor,
      body: SplashViewBody(),
    );
  }
}
