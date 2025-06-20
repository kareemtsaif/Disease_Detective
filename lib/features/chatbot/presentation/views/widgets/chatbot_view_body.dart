import 'package:flutter/material.dart';
import 'package:disease_detective/core/utils/colors.dart';
import 'package:disease_detective/core/utils/images.dart';
import 'package:disease_detective/core/utils/strings.dart';
import 'package:disease_detective/core/widgets/custom_button_primary.dart';
import 'package:disease_detective/core/widgets/custom_head_title.dart';
import 'package:disease_detective/core/widgets/custom_sub_title.dart';
import 'package:disease_detective/features/chatbot/presentation/views/chat_screen_view.dart'
    show ChatScreenView;

class ChatbotViewBody extends StatelessWidget {
  const ChatbotViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 15),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const CustomHeadTitle(title: AppString.chatbot),
              const SizedBox(height: 16),
              Image.asset(
                AppImage.chatBot,
              ),
              const SizedBox(height: 16),
              const Text(
                AppString.howCanWeHelpYou,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: AppColor.bodyColor,
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              const SizedBox(height: 20),
              const CustomSubTitle(subtitle: AppString.subTitleChatBot),
              const SizedBox(height: 40),
              CustomButtonPrimary(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ChatScreenView(),
                  ));
                },
                buttonName: AppString.newChat,
              ),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
