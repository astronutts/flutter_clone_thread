import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_app/board/models/board_model.dart';

class BoardViewModel extends AsyncNotifier<BoardModel> {
  @override
  FutureOr<BoardModel> build() {
    return BoardModel.empty();
  }

  
}

final boardProvider = AsyncNotifierProvider(
  () => BoardViewModel(),
);
