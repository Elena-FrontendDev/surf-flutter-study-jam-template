import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_practice_chat_flutter/cubit/chat/chat_cubit.dart';

class ChatTextField extends StatefulWidget {
  const ChatTextField({Key? key}) : super(key: key);

  @override
  _ChatTextFieldState createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: TextField(
            controller: _textController,
            keyboardType: TextInputType.multiline,
            maxLines: 4,
            style: const TextStyle(color: Colors.deepPurple),
            cursorColor: Colors.deepPurple,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.cyan),
              ),
              hintText: 'Сообщение',
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            _sendMessage();
            _textController.clear();
          },
          icon: const Icon(Icons.send),
        ),
      ],
    );
  }

  Future<void> _sendMessage() async {
    context.read<ChatCubit>().sendMessage(_textController.text.trim());
  }
}
