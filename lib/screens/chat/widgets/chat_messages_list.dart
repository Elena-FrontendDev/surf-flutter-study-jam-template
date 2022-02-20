import 'package:flutter/material.dart';
import 'package:surf_practice_chat_flutter/data/chat/models/message.dart';
import 'package:surf_practice_chat_flutter/data/chat/models/user.dart';
import 'package:surf_practice_chat_flutter/screens/chat/widgets/chat_message_item.dart';

class ChatMessagesList extends StatelessWidget {
  final List<ChatMessageDto> messages;

  const ChatMessagesList(this.messages, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      reverse: true,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final item = messages[index];
        return ChatMessageItem(
          item,
          item.author is ChatUserLocalDto,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 8);
      },
    );
  }
}
