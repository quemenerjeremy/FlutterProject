class CheckBoxListTileModel {
  int userId;
  String title;
  bool isCheck;

  CheckBoxListTileModel({this.userId, this.title, this.isCheck});

  static List<CheckBoxListTileModel> getUsers() {
    return <CheckBoxListTileModel>[
      CheckBoxListTileModel(
          userId: 1,
          title: "Latest",
          isCheck: false),
      CheckBoxListTileModel(
          userId: 2,
          title: "France",
          isCheck: false),
      CheckBoxListTileModel(
          userId: 3,
          title: "World",
          isCheck: false),
      CheckBoxListTileModel(
          userId: 4,
          title: "Technology",
          isCheck: false),
      CheckBoxListTileModel(
          userId: 5,
          title: "Entertainment",
          isCheck: false),
    ];
  }
}