import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:disease_detective/core/utils/colors.dart';
import 'package:disease_detective/features/onBoarding/presentation/manager/onBoarding/on_boarding_cubit.dart';
import 'package:disease_detective/features/onBoarding/data/static/on_boarding_list.dart';

class CustomSlider extends StatelessWidget {
  final void Function(int)? onPageChanged;
  const CustomSlider({super.key, this.onPageChanged});

  @override
  Widget build(BuildContext context) {
    var onBoardingCubit = BlocProvider.of<OnBoardingCubit>(context);

    return PageView.builder(
      controller: onBoardingCubit.controller,
      onPageChanged: (value) {
        onBoardingCubit.changePage(value);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              width: 204,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(onBoardingList[index].image!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              onBoardingList[index].body!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColor.bodyColor,
                fontSize: 21,
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ],
        );
      },
    );
  }
}
