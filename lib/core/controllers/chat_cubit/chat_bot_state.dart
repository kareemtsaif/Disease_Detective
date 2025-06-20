part of 'chat_bot_cubit.dart';

abstract class ChatBotState {}

 class ChatBotInitial extends ChatBotState {}
 class ChatBotLoading extends ChatBotState {}
class ChatBotLoaded extends ChatBotState {
 final List<MessageModel> messages;
 ChatBotLoaded({required this.messages});
}

