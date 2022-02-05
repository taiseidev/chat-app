import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../model/chat/chat_message_model.dart';

part 'chat_state.freezed.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
    @Default(<ChatMessageModel>[]) List<ChatMessageModel> chatMessageList,
    @Default('') String userId,
    @Default('') String userName,
    @Default('') String groupName,
  }) = _ChatState;
}
