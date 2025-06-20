part of 'sign_up_cubit.dart';

sealed class SignUpState {
  const SignUpState();
}

final class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final String message;

  SignUpSuccess(this.message);
}

class SignUpFailure extends SignUpState {
  final String errMessage;

  const SignUpFailure(this.errMessage);
}

class TogglePasswordVisibility extends SignUpState {}
