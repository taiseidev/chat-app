import 'package:chatapp/model/user/user_model.dart';
import 'package:chatapp/repository/firestore_repository.dart';
import 'package:chatapp/state/user_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserSearchScreenViewModel extends StateNotifier<UserState> {
  UserSearchScreenViewModel() : super(const UserState()) {
    getFriendInformation();
  }

  Future init() async {}

  Future getFriendInformation() async {
    state = state.copyWith(isLoading: true);

    try {
      final userList = await FirestoreRepository.fetchUsersInformation();
      state = state.copyWith(usersList: userList);
    } catch (e) {
      print(e);
    } finally {
      state = state.copyWith(isLoading: false);
      print('ユーザーリスト：${state.usersList}');
    }
  }

  Future<void> registerFrinedList(String name, String uid) async {
    state = state.copyWith(isLoading: true);
    await FirestoreRepository.registerFriendList(name, uid);
    state = state.copyWith(isLoading: false);
  }
}
