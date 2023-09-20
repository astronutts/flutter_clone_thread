class BoardModel {
  final String uid;
  final String comment;

  BoardModel({
    required this.uid,
    required this.comment,
  });

  BoardModel.empty()
      : uid = "",
        comment = "";
}
