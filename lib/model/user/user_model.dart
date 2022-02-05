import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info_model.freezed.dart';
part 'user_info_model.g.dart';

@freezed
class UserInfoModel with _$UserInfoModel {
  const factory UserInfoModel({
    @Default('') String userId,
    @Default('') String name,
    @Default('') String email,
    String? iconUrl,
    String? message,
  }) = _UserInfoModel;

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);

  factory UserInfoModel.fromSnapshot(
          DocumentSnapshot<Map<String, dynamic>> snapshot) =>
      UserInfoModel.fromJson(snapshot.data()!);
}
