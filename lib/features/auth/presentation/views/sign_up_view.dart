import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_guard/core/utils/colors.dart';
import 'package:health_guard/features/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../manager/signUp/sign_up_cubit.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    var signUpCubit = BlocProvider.of<SignUpCubit>(context);
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: signUpCubit.isLoading,
          progressIndicator: const CircularProgressIndicator(
            color: AppColor.primaryColor,
          ),
          child: const Scaffold(
            body: SignUpViewBody(),
          ),
        );
      },
    );
  }
}
