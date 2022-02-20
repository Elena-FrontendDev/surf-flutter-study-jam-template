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
        IconButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: const Text(
                      'Отправить сообщение с геолокацией?',
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          'Закрыть',
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          context.read<ChatCubit>().sendLocation();
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Отправить',
                        ),
                      )
                    ],
                  );
                });
          },
          icon: const Icon(
            Icons.share_location_outlined,
            color: Colors.deepPurple,
          ),
        ),
        Expanded(
          child: TextField(
            controller: _textController,
            keyboardType: TextInputType.multiline,
            minLines: 1,
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
