import 'package:chatapp/model/friend/friend_list_model.dart';
import 'package:chatapp/model/friend/friend_model.dart';
import 'package:chatapp/viewModel/user_search_screen_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repository/firestore_repository.dart';
import '../state/user_state.dart';
import '../viewModel/home_page_state_notifier.dart';
import 'bottom_navigation_provider.dart';

final firestoreRepository = Provider<FirestoreRepository>(
  (_) => FirestoreRepository(),
);

final userStateNotifierProvider =
    StateNotifierProvider<UserStateNotifier, UserState>(
  (ref) => UserStateNotifier(),
);

final onIconTap = StateNotifierProvider(
  (ref) => ChangeBottomNavigation(0),
);

final userSearchPageProvider =
    StateNotifierProvider<UserSearchScreenViewModel, UserState>(
  (ref) => UserSearchScreenViewModel(),
);

final itemsStreamProvider = StreamProvider<List<FriendListModel>>((ref) {
  final stream = FirestoreRepository.fetchFriendList();
  return stream;
});
