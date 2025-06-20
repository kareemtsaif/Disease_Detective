import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_guard/core/utils/strings.dart';
part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitialState());
  int currentPage = 0;
  PageController controller = PageController();
  String buttonName = AppString.next;

  void changePage(int index) {
    currentPage = index;
    emit(OnBoardingChangePageState());
  }

  void nextPageButton() {
    currentPage++;
    controller.animateToPage(
      currentPage,
      duration: const Duration(milliseconds: 900),
      curve: Curves.fastLinearToSlowEaseIn,
    );
    emit(OnBoardingChangePageState());
  }
}
