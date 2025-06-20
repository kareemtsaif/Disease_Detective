import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:disease_detective/core/utils/colors.dart';
import 'package:disease_detective/features/onBoarding/presentation/manager/onBoarding/on_boarding_cubit.dart';
import 'package:disease_detective/features/onBoarding/data/static/on_boarding_list.dart';

class DotController extends StatelessWidget {
  const DotController({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          onBoardingList.length,
          (index) => BlocBuilder<OnBoardingCubit, OnBoardingState>(
            builder: (context, state) {
              return AnimatedContainer(
                curve: Curves.fastLinearToSlowEaseIn,
                margin: const EdgeInsets.only(right: 8),
                duration: const Duration(milliseconds: 900),
                width: BlocProvider.of<OnBoardingCubit>(context).currentPage ==
                        index
                    ? 32
                    : 12,
                height: 12,
                decoration: BoxDecoration(
                  color:
                      BlocProvider.of<OnBoardingCubit>(context).currentPage ==
                              index
                          ? AppColor.primaryColor
                          : AppColor.primaryColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(16),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
