import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message_model.freezed.dart';
part 'chat_message_model.g.dart';

@freezed
class ChatMessageModel with _$ChatMessageModel {
  const factory ChatMessageModel({
    String? chatId,
    required String userId,
    required String userName,
    String? userImageUrl,
    String? messageText,
    String? localImagePath,
    String? storageImagePath,
    String? messageImageName,
    int? messageImageSize,
    DateTime? sendTime,
    DateTime? createdAt,
    DateTime? deletedAt,
  }) = _ChatMessageModel;

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageModelFromJson(json);

  factory ChatMessageModel.fromSnapshot(
          DocumentSnapshot<Map<String, dynamic>> snapshot) =>
      ChatMessageModel.fromJson(snapshot.data()!);
}
