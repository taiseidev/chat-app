import 'package:chatapp/repository/firestore_repository.dart';
import 'package:chatapp/state/user_information_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeStateNotifier =
    StateNotifierProvider.autoDispose<HomeStateNotifier, UserInformationState>(
  (ref) => HomeStateNotifier(),
);

class HomeStateNotifier extends StateNotifier<UserInformationState> {
  HomeStateNotifier() : super(UserInformationState()) {
    // getUserData();
  }

  final _repository = FirestoreRepository();

  Future getUserData() async {
    state = state.copyWith(isLoading: true);

    // final result = await _repository.getUserData();

    // if (result != null) {
    //   state = state.copyWith(
    //     isLoading: false,
    //     isReadyData: true,
    //     userInfo: [],
    //   );
    // } else {
    //   state = state.copyWith(
    //     isLoading: false,
    //     isReadyData: false,
    //     userInfo: [],
    //   );
    // }
  }
}
