part of 'chat_cubit.dart';

class ChatState extends Equatable {
  final List<ChatMessageDto>? messages;
  final String? userName;
  final ResponseStatus? messagesStatus;

  const ChatState({this.messages, this.userName, this.messagesStatus});

  ChatState copyWith(
      {List<ChatMessageDto>? messages,
      String? userName,
      ResponseStatus? messagesStatus}) {
    return ChatState(
      messages: messages ?? this.messages,
      userName: userName ?? this.userName,
      messagesStatus: messagesStatus ?? this.messagesStatus,
    );
  }

  @override
  List<Object?> get props => [messages, userName, messagesStatus];
}

enum ResponseStatus { loading, success, failure }
