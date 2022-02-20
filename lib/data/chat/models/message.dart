import 'package:equatable/equatable.dart';
import 'package:surf_practice_chat_flutter/data/chat/models/geolocation.dart';
import 'package:surf_practice_chat_flutter/data/chat/models/user.dart';

/// Data transfer object representing simple chat message.
class ChatMessageDto extends Equatable {
  /// Message author.
  final ChatUserDto author;

  /// Chat message string.
  final String message;

  /// Creation date and time.
  final DateTime createdDateTime;

  const ChatMessageDto({
    required this.author,
    required this.message,
    required this.createdDateTime,
  });

  @override
  String toString() =>
      'ChatMessageDto(author: $author, message: $message, createdDate: $createdDateTime)';

  @override
  List<Object> get props => [author, message, createdDateTime];
}

/// Data transfer object representing geolocation chat message.
class ChatMessageGeolocationDto extends ChatMessageDto {
  /// Location point.
  final ChatGeolocationDto location;

  ChatMessageGeolocationDto({
    required ChatUserDto author,
    required this.location,
    required String message,
    required DateTime createdDate,
  }) : super(author: author, message: message, createdDateTime: createdDate);

  @override
  String toString() =>
      'ChatMessageGeolocationDto(location: $location) extends ${super
          .toString()}';
}
