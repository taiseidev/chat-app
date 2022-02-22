import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repository/firestore_repository.dart';
import '../state/user_state.dart';
import '../viewModel/home_page_state_notifier.dart';
import 'bottom_navigation_provider.dart';

final firestoreRepository = Provider<FirestoreRepository>(
  (_) => FirestoreRepository(),
);

final userStateNotifier = StateNotifierProvider<UserStateNotifier, UserState>(
  (ref) => UserStateNotifier(),
);

final onIconTap = StateNotifierProvider(
  (ref) => ChangeBottomNavigation(0),
);
