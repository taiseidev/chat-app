import 'package:chatapp/repository/firestore_repository.dart';
import 'package:chatapp/state/user_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserStateNotifier extends StateNotifier<UserState> {
  UserStateNotifier() : super(UserState()) {
    print('開始');
    init();
  }

  final _firestoreRepository = FirestoreRepository();
  // ホーム画面に遷移時に実行
  Future init() async {
    state = state.copyWith(isLoading: true);
    await getUserInformation();
    state = state.copyWith(isLoading: false);
  }

  Future<void> getUserInformation() async {
    final result = await _firestoreRepository.fetchGetUserInformation();
    state = state.copyWith(
      userInfo: result,
    );
  }
}
