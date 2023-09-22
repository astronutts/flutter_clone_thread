import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_app/board/models/board_model.dart';

class BoardViewModel extends AsyncNotifier<BoardModel> {

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  @override
  FutureOr<BoardModel> build() {
    return BoardModel.empty();
  }

  



  
}

final boardProvider = AsyncNotifierProvider(
  () => BoardViewModel(),
);
