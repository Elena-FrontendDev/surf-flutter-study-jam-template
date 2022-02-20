import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:surf_practice_chat_flutter/data/chat/models/geolocation.dart';
import 'package:surf_practice_chat_flutter/data/chat/models/message.dart';
import 'package:surf_practice_chat_flutter/data/chat/repository/firebase.dart';
import 'package:surf_practice_chat_flutter/data/chat/repository/location.dart';
import 'package:surf_practice_chat_flutter/service/locator.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(const ChatState()) {
    getMessages();
  }

  final _chatRepository = locator<ChatRepositoryFirebase>();
  final _locationRepository = LocationRepository();

  Future<void> getMessages() async {
    emit(state.copyWith(messagesStatus: ResponseStatus.loading));
    // TODO: added error handler
    await _chatRepository.messages.then((res) {
      emit(state.copyWith(
          messages: res, messagesStatus: ResponseStatus.success));
    });
  }

  void submitName(String value) {
    // TODO: add check for name length
    emit(state.copyWith(userName: value));
  }

  Future<void> sendMessage(String value) async {
    // TODO: add message error for empty user
    if (state.userName?.isEmpty ?? true) return;
    _chatRepository.sendMessage(state.userName!, value).then((value) {
      emit(state.copyWith(messages: value));
    });
  }

  Future<void> sendLocation() async {
    // TODO: add message error for empty user
    if (state.userName?.isEmpty ?? true) return;

    try {
      await _locationRepository.userPosition().then((value) {
        _chatRepository
            .sendGeolocationMessage(
                nickname: state.userName!,
                location: ChatGeolocationDto(
                    latitude: value.latitude, longitude: value.longitude))
            .then((value) {
          emit(state.copyWith(messages: value));
        });
      });
    } catch (e) {
      print(e);
    }
  }
}
