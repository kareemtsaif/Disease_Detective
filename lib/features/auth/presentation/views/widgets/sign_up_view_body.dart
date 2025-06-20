import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:disease_detective/core/functions/custom_snack_bar.dart';
import 'package:disease_detective/core/utils/router.dart';
import 'package:disease_detective/core/utils/strings.dart';
import 'package:disease_detective/core/widgets/custom_button_primary.dart';
import 'package:disease_detective/core/widgets/custom_head_title.dart';
import 'package:disease_detective/core/widgets/custom_sub_title.dart';
import 'package:disease_detective/features/auth/presentation/manager/signUp/sign_up_cubit.dart';
import 'package:disease_detective/features/auth/presentation/views/widgets/custom_text_button_auth.dart';
import 'package:disease_detective/features/auth/presentation/views/widgets/custom_text_field_auth.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var signUpCubit = BlocProvider.of<SignUpCubit>(context);
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 15),
          child: Form(
            autovalidateMode: AutovalidateMode.onUnfocus,
            key: signUpCubit.formKey,
            child: Column(
              children: [
                const CustomHeadTitle(
                  title: AppString.createAccount,
                ),
                const CustomSubTitle(
                  subtitle: AppString.subTitleSignUp,
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomTextField(
                  controller: signUpCubit.firstNameController,
                  hintText: AppString.enterYourFirstName,
                  headTextField: AppString.firstName,
                  icon: Icons.person_2_outlined,
                  keyboard: TextInputType.name,
                  validator: signUpCubit.validateFirstName,
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomTextField(
                  controller: signUpCubit.lastNameController,
                  hintText: AppString.enterYourLastName,
                  headTextField: AppString.lastName,
                  icon: Icons.person_2_outlined,
                  keyboard: TextInputType.name,
                  validator: signUpCubit.validateLastName,
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomTextField(
                  controller: signUpCubit.emailController,
                  hintText: AppString.enterYourEmail,
                  headTextField: AppString.email,
                  icon: Icons.email_outlined,
                  keyboard: TextInputType.emailAddress,
                  validator: signUpCubit.validateEmail,
                ),
                const SizedBox(
                  height: 25,
                ),
                BlocBuilder<SignUpCubit, SignUpState>(
                  builder: (context, state) {
                    return CustomTextField(
                      controller: signUpCubit.passwordController,
                      suffixIcon: IconButton(
                        onPressed: () {
                          signUpCubit.togglePasswordVisibility();
                        },
                        icon: Icon(signUpCubit.passIcon),
                      ),
                      hintText: AppString.enterYourPassword,
                      headTextField: AppString.password,
                      icon: Icons.lock_outlined,
                      obscureText: signUpCubit.isVisible,
                      keyboard: TextInputType.visiblePassword,
                      validator: signUpCubit.validatePassword,
                    );
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                BlocBuilder<SignUpCubit, SignUpState>(
                  builder: (context, state) {
                    return CustomTextField(
                      controller: signUpCubit.passwordConfirmController,
                      suffixIcon: IconButton(
                        onPressed: () {
                          signUpCubit.toggleConfirmPasswordVisibility();
                        },
                        icon: Icon(signUpCubit.confirmPassIcon),
                      ),
                      hintText: AppString.enterYourPassword,
                      headTextField: AppString.confirmPassword,
                      icon: Icons.lock_outlined,
                      obscureText: signUpCubit.isConfirmVisible,
                      keyboard: TextInputType.visiblePassword,
                      validator: signUpCubit.validateConfirmPassword,
                    );
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                BlocListener<SignUpCubit, SignUpState>(
                  listener: (context, state) {
                    if (state is SignUpSuccess) {
                      GoRouter.of(context).go(AppRouter.kSignInView);
                    } else if (state is SignUpFailure) {
                      customSnackbar(context, state.errMessage);
                    }
                  },
                  child: CustomButtonPrimary(
                    buttonName: AppString.signUp,
                    onPressed: () {
                      signUpCubit.validate();
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextButtonAuth(
                  onTap: () {
                    GoRouter.of(context).go(AppRouter.kSignInView);
                  },
                  text: AppString.alreadyHaveAnAccount,
                  button: AppString.signin,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
