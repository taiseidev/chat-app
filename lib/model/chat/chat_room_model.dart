import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'chat_message_model.dart';

part 'chat_room_model.freezed.dart';
part 'chat_room_model.g.dart';

@freezed
class ChatRoomModel with _$ChatRoomModel {
  const factory ChatRoomModel({
    required String roomId,
    required String roomName,
    @Default(<ChatMessageModel>[]) List<ChatMessageModel> chatMessageList,
  }) = _ChatRoomModel;

  factory ChatRoomModel.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomModelFromJson(json);

  factory ChatRoomModel.fromSnapshot(
          DocumentSnapshot<Map<String, dynamic>> snapshot) =>
      ChatRoomModel.fromJson(snapshot.data()!);
}
