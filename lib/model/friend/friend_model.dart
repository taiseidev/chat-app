import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend_model.freezed.dart';
part 'friend_model.g.dart';

@freezed
class FriendModel with _$FriendModel {
  const factory FriendModel({
    required String userId,
    required String userName,
    required String iconURL,
  }) = _FriendModel;

  factory FriendModel.fromJson(Map<String, dynamic> json) =>
      _$FriendModelFromJson(json);

  factory FriendModel.fromSnapshot(
          DocumentSnapshot<Map<String, dynamic>> snapshot) =>
      FriendModel.fromJson(snapshot.data()!);
}
