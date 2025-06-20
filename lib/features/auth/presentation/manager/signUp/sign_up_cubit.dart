import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_guard/features/auth/data/repos/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());
  final AuthRepo authRepo;
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  bool isLoading = false;
  bool isVisible = true;
  bool isConfirmVisible = true;
  IconData passIcon = Icons.visibility_off_outlined;
  IconData confirmPassIcon = Icons.visibility_off_outlined;

  Future<void> signUp() async {
    isLoading = true;
    emit(SignUpLoading());
    var result = await authRepo.signUp(
      firstNameController.text,
      lastNameController.text,
      emailController.text,
      passwordController.text,
      passwordConfirmController.text,
    );
    result.fold(
      (failure) {
        // print('==================');
        isLoading = false;
        emit(SignUpFailure(failure.errMessage));
      },
      (success) {
        // print(success.message);
        isLoading = false;
        emit(SignUpSuccess(success.message.toString()));
      },
    );
  }

  validate() {
    if (formKey.currentState!.validate()) {
      signUp();
    }
  }

  void togglePasswordVisibility() {
    isVisible = !isVisible;
    passIcon =
        isVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(TogglePasswordVisibility());
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmVisible = !isConfirmVisible;
    confirmPassIcon = isConfirmVisible
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
    emit(TogglePasswordVisibility());
  }

  String? validateFirstName(String? value) {
    if (value!.isEmpty) {
      return 'this field is required';
    }
    return null;
  }

  String? validateLastName(String? value) {
    if (value!.isEmpty) {
      return 'this field is required';
    }
    return null;
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

  String? validatePassword(String? value) {
    final bool isValidPassword =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
            .hasMatch(value!);
    if (value.isEmpty) {
      return 'this field is required';
    } else if (!isValidPassword) {
      return 'password must contain at least 8 characters\n, including uppercase, lowercase, numbers and special characters';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (passwordController.text != passwordConfirmController.text) {
      return 'password and confirm password not match';
    }
    return null;
  }
}
