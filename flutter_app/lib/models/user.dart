import 'package:flutter_app/models/articles.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {

  String username;
  String country;
  List<bool> selectTopic;
  List<String> listTopics;
  List<Articles> favArticles;

  User(
      {
        this.username = "Username",
        this.country = "gb",
        this.selectTopic,
        this.listTopics,
        this.favArticles,
      }
      );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}