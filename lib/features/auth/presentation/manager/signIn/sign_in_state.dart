part of 'sign_in_cubit.dart';

sealed class SignInState {
  const SignInState();
}

final class SignInIntial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {
  final String token;

  SignInSuccess(this.token);
}

class SignInFailure extends SignInState {
  final String errMessage;

  const SignInFailure(this.errMessage);
}

class TogglePasswordVisibility extends SignInState {}
