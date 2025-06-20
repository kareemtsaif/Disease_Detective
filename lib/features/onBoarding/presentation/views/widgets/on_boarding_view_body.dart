import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:health_guard/core/utils/router.dart';
import 'package:health_guard/core/utils/strings.dart';
import 'package:health_guard/core/widgets/custom_button_primary.dart';
import 'package:health_guard/features/onBoarding/presentation/manager/onBoarding/on_boarding_cubit.dart';
import 'package:health_guard/features/onBoarding/presentation/views/widgets/custom_text_button_onboarding.dart';
import 'package:health_guard/features/onBoarding/presentation/views/widgets/dot_controller.dart';
import 'package:health_guard/features/onBoarding/presentation/views/widgets/custom_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    var onBoardingCubit = BlocProvider.of<OnBoardingCubit>(context);
    return SafeArea(
      child: Column(
        children: [
          const CustomTextButtonOnboarding(),
          const Spacer(
            flex: 1,
          ),
          const Expanded(
            flex: 5,
            child: CustomSlider(),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                const DotController(),
                const Spacer(),
                BlocConsumer<OnBoardingCubit, OnBoardingState>(
                  listener: (context, state) async {
                    if (state is OnBoardingChangePageState) {
                      if (onBoardingCubit.currentPage == 3) {
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setBool('seenOnboarding', true);
                        context.go(AppRouter.kSignInView);
                      } else if (onBoardingCubit.currentPage == 2) {
                        onBoardingCubit.buttonName = AppString.getStarted;
                      } else {
                        onBoardingCubit.buttonName = AppString.next;
                      }
                    }
                  },
                  builder: (context, state) {
                    return CustomButtonPrimary(
                      buttonName: onBoardingCubit.buttonName,
                      onPressed: () {
                        onBoardingCubit.nextPageButton();
                      },
                    );
                  },
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
