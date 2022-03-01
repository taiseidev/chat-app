import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend_list_model.freezed.dart';
part 'friend_list_model.g.dart';

@freezed
class FriendListModel with _$FriendListModel {
  const factory FriendListModel({
    @Default('') String name,
    @Default('') String userId,
  }) = _FriendListModel;

  factory FriendListModel.fromJson(Map<String, dynamic> json) =>
      _$FriendListModelFromJson(json);

  factory FriendListModel.fromSnapshot(
          DocumentSnapshot<Map<String, dynamic>> snapshot) =>
      FriendListModel.fromJson(snapshot.data()!);
}
