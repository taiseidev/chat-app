import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_information_state.freezed.dart';

@freezed
class UserInformationState with _$UserInformationState {
  const factory UserInformationState({
    @Default(false) bool isLoading,
    @Default(false) bool isReadyData,
  }) = _UserInformationState;
}
