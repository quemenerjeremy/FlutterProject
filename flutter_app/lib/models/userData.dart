class UserData {

  String username;
  String country;
  List<String> listTopics;
  List<bool> selectTopic;

  UserData(
            {
              this.username = "Username",
              this.country = "fr",
              this.listTopics,
              this.selectTopic
            });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      username: json["username"] ?? "username",
      country: json["country"] ?? "fr",
      listTopics: json["listTopics"].cast<String>(),
      selectTopic: json["selectTopic"].cast<bool>(),
    );
  }
  Map<String, dynamic> toJson() => {
    "username": username,
    "country": country,
    "listTopics":  listTopics,
    "selectTopic": selectTopic

  };
}