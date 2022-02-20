import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_practice_chat_flutter/cubit/chat/chat_cubit.dart';
import 'package:surf_practice_chat_flutter/screens/chat/chat_screen.dart';
import 'package:surf_practice_chat_flutter/screens/chat/widgets/chat_appbar_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const ChatAppbarTextField(),
          actions: [
            Builder(builder: (context) {
              return IconButton(
                  onPressed: () => context.read<ChatCubit>().getMessages(),
                  icon: const Icon(Icons.refresh));
            })
          ],
        ),
        body: const ChatScreen(),
      ),
    );
  }
}
