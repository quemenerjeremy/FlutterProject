// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    username: json['username'] as String,
    country: json['country'] as String,
    selectTopic: (json['selectTopic'] as List)?.map((e) => e as bool)?.toList(),
    listTopics: (json['listTopics'] as List)?.map((e) => e as String)?.toList(),
    favArticles: (json['favArticles'] as List)
        ?.map((e) =>
            e == null ? null : Articles.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'username': instance.username,
      'country': instance.country,
      'selectTopic': instance.selectTopic,
      'listTopics': instance.listTopics,
      'favArticles': instance.favArticles,
    };
