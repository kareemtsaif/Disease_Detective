import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:disease_detective/core/utils/colors.dart';
import 'package:disease_detective/core/utils/images.dart';
import 'package:disease_detective/core/utils/router.dart';
import 'package:disease_detective/core/utils/strings.dart';
import 'package:disease_detective/core/widgets/custom_button_primary.dart';
import 'package:disease_detective/core/widgets/title_sub_title_image.dart';
import 'package:disease_detective/features/auth/presentation/views/widgets/custom_text_button_auth.dart';

class VerifyEmailViewBody extends StatelessWidget {
  const VerifyEmailViewBody({super.key});

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
                title: AppString.verifyYourEmail,
                subtitle: AppString.descriptionVerify,
                image: AppImage.verify,
              ),
              const SizedBox(
                height: 40,
              ),
              OtpTextField(
                contentPadding: const EdgeInsets.symmetric(vertical: 25),
                keyboardType: TextInputType.number,
                margin: const EdgeInsets.only(right: 16),
                borderRadius: BorderRadius.circular(8),
                fieldWidth: 74,
                cursorColor: AppColor.primaryColor,
                focusedBorderColor: AppColor.primaryColor,
                numberOfFields: 4,
                borderColor: AppColor.primaryColor,
                showFieldAsBox: true,
                onCodeChanged: (String code) {},
                onSubmit: (String verificationCode) {}, // end onSubmit
              ),
              const SizedBox(height: 58),
              CustomButtonPrimary(
                buttonName: AppString.verify,
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kNewPasswordView);
                },
              ),
              CustomTextButtonAuth(
                text: AppString.receivedCode,
                button: AppString.resend,
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
