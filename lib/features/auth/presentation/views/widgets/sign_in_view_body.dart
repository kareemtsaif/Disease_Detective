import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:disease_detective/core/utils/colors.dart';
import 'package:disease_detective/core/utils/router.dart';
import 'package:disease_detective/core/utils/strings.dart';
import 'package:disease_detective/core/widgets/custom_button_primary.dart';
import 'package:disease_detective/core/widgets/custom_head_title.dart';
import 'package:disease_detective/core/widgets/custom_sub_title.dart';
import 'package:disease_detective/features/auth/presentation/manager/signIn/sign_in_cubit.dart';
import 'package:disease_detective/features/auth/presentation/views/widgets/custom_text_button_auth.dart';
import 'package:disease_detective/features/auth/presentation/views/widgets/custom_text_field_auth.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var signInCubit = BlocProvider.of<SignInCubit>(context);
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 15),
          child: Form(
            autovalidateMode: AutovalidateMode.onUnfocus,
            key: signInCubit.formKey,
            child: Column(
              children: [
                CustomHeadTitle(
                  title: AppString.welcomeBack,
                ),
                CustomSubTitle(
                  subtitle: AppString.subTitleSignIn,
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomTextField(
                  hintText: AppString.enterYourEmail,
                  headTextField: AppString.email,
                  icon: Icons.email_outlined,
                  keyboard: TextInputType.emailAddress,
                  controller: signInCubit.emailController,
                  validator: signInCubit.validateEmail,
                ),
                const SizedBox(
                  height: 25,
                ),
                BlocBuilder<SignInCubit, SignInState>(
                  builder: (context, state) {
                    return CustomTextField(
                      suffixIcon: IconButton(
                        onPressed: () {
                          signInCubit.togglePasswordVisibility();
                        },
                        icon: Icon(signInCubit.passIcon),
                      ),
                      hintText: AppString.enterYourPassword,
                      headTextField: AppString.password,
                      icon: Icons.lock_outlined,
                      obscureText: signInCubit.isVisible,
                      keyboard: TextInputType.visiblePassword,
                      controller: signInCubit.passwordController,
                      validator: signInCubit.passwordValidator,
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        GoRouter.of(context)
                            .push(AppRouter.kForgetPasswordView);
                      },
                      child: const Text(
                        AppString.forgotPassword,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColor.primaryColor,
                          letterSpacing: -0.28,
                          height: 0,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
                CustomButtonPrimary(
                  onPressed: () {
                    signInCubit.validate(context);
                  },
                  buttonName: AppString.signin,
                ),
                CustomTextButtonAuth(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kSignUpView);
                  },
                  text: AppString.haveAnAccount,
                  button: AppString.signUp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
