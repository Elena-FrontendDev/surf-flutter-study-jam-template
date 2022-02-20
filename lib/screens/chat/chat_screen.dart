import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_practice_chat_flutter/cubit/chat/chat_cubit.dart';

import 'package:surf_practice_chat_flutter/data/chat/repository/repository.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom + 16,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                if (state.messages?.isNotEmpty ?? false) {
                  return ListView.builder(
                      itemCount: state.messages!.length,
                      itemBuilder: (context, index) {
                        return Text(state.messages![index].message);
                      });
                }
                if (state.messagesStatus == ResponseStatus.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: _textController,
                  style: const TextStyle(color: Colors.deepPurple),
                  cursorColor: Colors.deepPurple,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                    hintText: 'Сообщение',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  onChanged: (value) {},
                ),
              ),
              IconButton(
                onPressed: () {
                  context
                      .read<ChatCubit>()
                      .sendMessage(_textController.text.trim());
                  _textController.clear();
                },
                icon: const Icon(Icons.send),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
