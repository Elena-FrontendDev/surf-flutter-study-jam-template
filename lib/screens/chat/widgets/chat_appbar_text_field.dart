import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_practice_chat_flutter/cubit/chat/chat_cubit.dart';

class ChatAppbarTextField extends StatefulWidget {
  const ChatAppbarTextField({Key? key}) : super(key: key);

  @override
  _ChatAppbarTextFieldState createState() => _ChatAppbarTextFieldState();
}

class _ChatAppbarTextFieldState extends State<ChatAppbarTextField> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textController,
      style: const TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Введите ник',
        hintStyle: TextStyle(color: Colors.grey),
      ),
      onSubmitted: (value) {
        if (value.trim().isNotEmpty) {
          context.read<ChatCubit>().submitName(value);
        }
      },
    );
  }
}
