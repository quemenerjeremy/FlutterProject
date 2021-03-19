class UserData {

  String username;
  String country;
  List<String> listTopics;
  List<bool> choiceTopic;

  UserData(
            {
              this.username = "Username",
              this.country = "fr",
              this.listTopics,
              this.choiceTopic
            });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      username: json["username"] ?? "username",
      country: json["country"] ?? "fr",
      listTopics: json["listTopics"].cast<String>(),
      choiceTopic: json["choiceTopic"].cast<bool>(),
    );
  }
  Map<String, dynamic> toJson() => {
    "username": username,
    "country": country,
    "listTopics":  listTopics,
    "choiceTopic": choiceTopic

  };
}