import 'package:flutter/material.dart';
import 'package:health_guard/core/utils/images.dart';
import 'package:health_guard/core/utils/strings.dart';
import 'package:health_guard/core/widgets/custom_button_primary.dart';
import 'package:health_guard/core/widgets/title_sub_title_image.dart';
import 'package:health_guard/features/auth/presentation/views/widgets/custom_text_field_auth.dart';
import 'package:health_guard/core/functions/dialog.dart';

class NewPasswordViewBody extends StatelessWidget {
  const NewPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 15),
          child: Column(
            children: [
              const TitleSubTitleImage(
                title: AppString.createNewPassword,
                subtitle: AppString.descriptionNewPassword,
                image: AppImage.newPassword,
              ),
              const SizedBox(
                height: 40,
              ),
              const CustomTextField(
                hintText: AppString.enterYourPassword,
                headTextField: AppString.password,
                icon: Icons.lock_outlined,
                keyboard: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 25,
              ),
              const CustomTextField(
                hintText: AppString.enterYourPassword,
                headTextField: AppString.confirmPassword,
                icon: Icons.lock_outlined,
                keyboard: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 40,
              ),
              CustomButtonPrimary(
                buttonName: AppString.resetPassword,
                onPressed: () {
                  dialog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
