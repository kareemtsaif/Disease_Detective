import 'dart:async';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:disease_detective/core/helpers/dio_helper.dart';
import 'package:disease_detective/features/chatbot/data/model/message_model.dart';

part 'chat_bot_state.dart';

class ChatBotCubit extends Cubit<ChatBotState> {
  ChatBotCubit() : super(ChatBotInitial()) {
    welcomeMessage();
    textFocusNode.addListener(_onTextFieldFocusChanged);
  }
  TextEditingController textEditingController = TextEditingController();
  ScrollController scrollController = ScrollController();
  List<MessageModel> messages = [];
  FocusNode textFocusNode = FocusNode();
  void _onTextFieldFocusChanged() {
    if (textFocusNode.hasFocus) {
      Future.delayed(const Duration(milliseconds: 300), scrollToBottom);
    }
  }

  final _messageStreamController =
      StreamController<List<MessageModel>>.broadcast();
  Stream<List<MessageModel>> get messagesStream =>
      _messageStreamController.stream;
  Future<void> sendMessage() async {
    if (textEditingController.text.isEmpty) return;
    final userMessage =
        MessageModel(text: textEditingController.text, isMe: true);
    messages.add(userMessage);
    textEditingController.clear();
    _messageStreamController.sink.add(List.from(messages));
    emit(ChatBotLoaded(messages: List.from(messages)));
    try {
      emit(ChatBotLoading());
      final response = await DioHelper.send(sendMessage as String, data: {
        "recipientId": "6b552284-f92b-46c5-a5b9-6eaa27bf174b",
        "text": userMessage.text,
      });

      if (response.isSuccess) {
        String botResponse =
            response.data?['data']['response'] ?? "No response";
        final botMessage = MessageModel(text: botResponse, isMe: false);
        messages.add(botMessage);
        _messageStreamController.sink.add(List.from(messages));
        WidgetsBinding.instance.addPostFrameCallback((_) => scrollToBottom());
        emit(ChatBotLoaded(messages: List.from(messages)));
        Future.delayed(const Duration(milliseconds: 300), () {
          scrollToBottom();
        });
      } else {
        final errorMessage = MessageModel(
            text: "حدثت مشكلة في معالجة طلبك. الرجاء المحاولة مرة أخرى.",
            isMe: false);
        messages.add(errorMessage);
        _messageStreamController.sink.add(List.from(messages));
        WidgetsBinding.instance.addPostFrameCallback((_) => scrollToBottom());
        emit(ChatBotInitial());

        log("Failed to get response from bot.StatusCode:${response.statusCode}");
      }
    } catch (e) {
      log("The error cause: ${e.toString()}");
    }
  }

  @override
  Future<void> close() {
    textFocusNode.dispose();
    _messageStreamController.close();
    return super.close();
  }

  void welcomeMessage() {
    final welcomeMessage =
        MessageModel(isMe: false, text: "Hello, How can i help you");
    messages.add(welcomeMessage);
    _messageStreamController.sink.add(List.from(messages));
    emit(ChatBotLoaded(messages: List.from(messages)));
  }

  void scrollToBottom() {
    if (scrollController.hasClients) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    }
  }
}
