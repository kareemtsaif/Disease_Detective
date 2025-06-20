import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_guard/core/functions/auto_token_manger.dart';
import 'package:health_guard/features/auth/data/repos/auth_repo.dart';
part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInIntial());
  final AuthRepo authRepo;
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  bool isVisible = true;
  IconData passIcon = Icons.visibility_off_outlined;
  Future<void> login(BuildContext context) async {
    // SharedPreferences pref = await SharedPreferences.getInstance();
    isLoading = true;
    emit(SignInLoading());
    var result = await authRepo.login(
      emailController.text,
      passwordController.text,
    );

    result.fold(
      (failure) {
        isLoading = false;
        emit(SignInFailure(failure.errMessage));
      },
      (data) async {
        // print(data.token);
        // await pref.setString('token', data.token.toString());
        await AuthTokenManager.saveToken(data.token.toString());
        final token = await AuthTokenManager.getToken();
        log("Saved Token: $token");

        isLoading = false;
        emit(SignInSuccess(data.token?.toString() ?? ''));
        // final token = pref.getString('token') ?? '';
        // context.go('/homeView', extra: token);
      },
    );
  }

  validate(BuildContext context) {
    if (formKey.currentState!.validate()) {
      login(context);
    }
  }

  void togglePasswordVisibility() {
    isVisible = !isVisible;
    passIcon =
        isVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(TogglePasswordVisibility());
  }

  String? validateEmail(String? value) {
    final bool isValidEmail =
        RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
            .hasMatch(value!);
    if (value.isEmpty) {
      return 'this field is required';
    } else if (!isValidEmail) {
      return 'please enter a valid email';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return 'this field is required';
    }
    return null;
  }

  // checkToken() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   var token = pref.getString('token');
  //   if (token != null || token!.isNotEmpty) {
  //     emit(SignInSuccess());
  //   }
  // }
}

  // void navigateToHomeView(BuildContext context) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final token = prefs.getString('token') ?? '';

  //                     GoRouter.of(context).go(AppRouter.kHomeView);
  // }

