import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_guard/core/controllers/chat_cubit/chat_bot_cubit.dart';
import 'package:health_guard/core/utils/colors.dart';
import 'package:health_guard/core/utils/icons.dart';
import 'package:health_guard/core/utils/images.dart';
import 'package:health_guard/core/widgets/custom_svg.dart';
import 'package:health_guard/features/chatbot/presentation/views/widgets/custom_app_bar_for_chat_bot.dart';

class ChatScreenViewBody extends StatelessWidget {
  const ChatScreenViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ChatBotCubit(),
        child: Scaffold(
            backgroundColor: Colors.white,
            extendBody: true,
            appBar: const CustomAppBarForChatBot(),
            body: BlocBuilder<ChatBotCubit, ChatBotState>(
                builder: (context, blocState) {
              final cubit = BlocProvider.of<ChatBotCubit>(context);
              return StreamBuilder(
                  stream: cubit.messagesStream,
                  initialData: cubit.messages,
                  builder: (context, state) {
                    final messages = state.data ?? [];
                    final cubit = context.read<ChatBotCubit>();
                    return Column(children: [
                      Expanded(
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            controller: cubit.scrollController,
                            itemCount: messages.length,
                            itemBuilder: (context, index) {
                              final message = messages[index];
                              final isMe = messages[index].isMe;
                              return Row(
                                mainAxisAlignment: message.isMe == true
                                    ? MainAxisAlignment.end
                                    : MainAxisAlignment.start,
                                children: [
                                  if (!isMe) ...{
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Image.asset(
                                        AppImage.robot,
                                        width: 50,
                                      ),
                                    )
                                  },
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: BubbleSpecialThree(
                                      text: message.text,
                                      isSender: isMe,
                                      tail: false,
                                      sent: isMe,
                                      // constraints:
                                      //     const BoxConstraints(maxWidth: 300),
                                      color: isMe == true
                                          ? AppColor.primaryColor
                                          : AppColor.grey,
                                      textStyle: TextStyle(
                                        color: isMe == true
                                            ? AppColor.grey
                                            : AppColor.primaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: AppColor.grey,
                          width: 2.0,
                        )),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(25.0),
                                  border: Border.all(
                                    color: AppColor.grey,
                                    width: 1.0,
                                  ),
                                ),
                                child: TextFormField(
                                  maxLines: null,
                                  keyboardType: TextInputType.multiline,
                                  textInputAction: TextInputAction.newline,
                                  cursorColor: AppColor.primaryColor,
                                  controller: cubit.textEditingController,
                                  focusNode: cubit.textFocusNode,
                                  decoration: const InputDecoration(
                                    hintText: 'Type a message...',
                                    hintStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20.0,
                                      vertical: 12.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12.0),
                            Container(
                              margin: const EdgeInsets.only(right: 8.0),
                              padding: const EdgeInsets.all(8.0),
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: AppColor.primaryColor,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        AppColor.primaryColor.withOpacity(0.3),
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: InkWell(
                                  onTap: () {
                                    cubit.sendMessage();
                                  },
                                  child: const CustomSvg(
                                    svgPath: AppIcon.send,
                                    color: AppColor.white,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ]);
                  });
            })));
  }
}
