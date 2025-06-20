import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:health_guard/core/utils/images.dart';
import 'package:health_guard/core/utils/router.dart';
import 'package:health_guard/core/utils/strings.dart';
import 'package:health_guard/core/widgets/custom_button_primary.dart';
import 'package:health_guard/core/widgets/title_sub_title_image.dart';
import 'package:health_guard/features/auth/presentation/views/widgets/custom_text_field_auth.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const TitleSubTitleImage(
                title: AppString.forgotPassword,
                subtitle: AppString.descriptionForgetPassword,
                image: AppImage.forgotPassword,
              ),
              const SizedBox(
                height: 40,
              ),
              const CustomTextField(
                hintText: AppString.enterYourEmail,
                headTextField: AppString.email,
                icon: Icons.email_outlined,
                keyboard: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 50,
              ),
              CustomButtonPrimary(
                buttonName: AppString.next,
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kVerifyEmailView);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
