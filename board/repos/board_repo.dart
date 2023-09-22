// ignore_for_file: unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_app/board/models/board_model.dart';

class BoardRepository {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> registerPage(BoardModel board) async {
    _db.collection("board").doc("IfQFArYoC75GF04eLNYD").set(board.toJson());
  }
}

final boardRepo = Provider((ref) => BoardRepository());
