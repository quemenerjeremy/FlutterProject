class CheckBoxListTileModel {
  int userId;
  String title;
  bool isCheck;

  CheckBoxListTileModel({this.userId, this.title, this.isCheck});

  static List<CheckBoxListTileModel> getUsers() {
    return <CheckBoxListTileModel>[
      CheckBoxListTileModel(
          userId: 1,
          title: "France",
          isCheck: true),
      CheckBoxListTileModel(
          userId: 1,
          title: "Belgium",
          isCheck: false),
      CheckBoxListTileModel(
          userId: 2,
          title: "United-State",
          isCheck: false),
      CheckBoxListTileModel(
          userId: 2,
          title: "Canada",
          isCheck: false),
      CheckBoxListTileModel(
          userId: 3,
          title: "United Kingdom",
          isCheck: false),
      CheckBoxListTileModel(
          userId: 4,
          title: "China",
          isCheck: false),
      CheckBoxListTileModel(
          userId: 5,
          title: "Japan",
          isCheck: false),
      CheckBoxListTileModel(
          userId: 5,
          title: "Morocco",
          isCheck: false),
      CheckBoxListTileModel(
          userId: 5,
          title: "Tunisia",
          isCheck: false),
    ];
  }
}