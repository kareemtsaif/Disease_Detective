import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:health_guard/core/functions/custom_snack_bar.dart';
import 'package:health_guard/core/utils/colors.dart';
import 'package:health_guard/core/utils/router.dart';
import 'package:health_guard/features/auth/presentation/manager/signIn/sign_in_cubit.dart';
import 'package:health_guard/features/auth/presentation/views/widgets/sign_in_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    var signInCubit = BlocProvider.of<SignInCubit>(context);
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) async {
        if (state is SignInFailure) {
          customSnackbar(context, state.errMessage);
        } else if (state is SignInSuccess) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('auth_token', state.token);
          context.go(AppRouter.kHomeView);
          customSnackbarSuccess(context, 'Login Successful');
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: signInCubit.isLoading,
          progressIndicator: const CircularProgressIndicator(
            color: AppColor.primaryColor,
          ),
          child: const Scaffold(
            body: SignInViewBody(),
          ),
        );
      },
    );
  }
}
