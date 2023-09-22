class BoardModel {
  final String imagepath;
  final String comment;

  BoardModel({
    required this.imagepath,
    required this.comment,
  });

  BoardModel.empty()
      : imagepath = "",
        comment = "";

  Map<String, String> toJson() {
    return {
      "imagepath": imagepath,
      "comment": comment,
    };
  }
}
