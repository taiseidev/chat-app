import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/chat_state.dart';

class ChatScreenViewModel extends StateNotifier<ChatState> {
  ChatScreenViewModel(ChatState state) : super(state) {
    init();
  }

  Future<void> init() async {}
}
