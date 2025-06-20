import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:disease_detective/core/utils/images.dart';
import 'package:disease_detective/core/utils/router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToOnBoarding();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: slidingAnimation,
        builder: (BuildContext context, _) => SlideTransition(
          position: slidingAnimation,
          child: Image.asset(AppImage.logo),
        ),
      ),
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0.0, 2), end: const Offset(0.0, 0.0))
            .animate(animationController);
    animationController.forward();
  }

  void navigateToOnBoarding() {
    Future.delayed(const Duration(seconds: 2), () {
      return GoRouter.of(context).go(AppRouter.kOnBoardingView);
    });
  }
}
