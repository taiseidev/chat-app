import 'package:freezed_annotation/freezed_annotation.dart';
import '../model/user/user_model.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default(false) bool isLoading,
    @Default(false) bool isReadyData,
    @Default(<UserModel>[]) List<UserModel> userInfoList,
    @Default(<UserModel>[]) List<UserModel> usersList,
    @Default(<dynamic>[]) List<dynamic> userNames,
    UserModel? userInfo,
  }) = _UserState;
}
