part of 'on_boarding_cubit.dart';

@immutable
sealed class OnBoardingState {}

class OnBoardingInitialState extends OnBoardingState {}

class OnBoardingChangePageState extends OnBoardingState {}
