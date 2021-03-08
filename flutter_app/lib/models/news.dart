import 'package:flutter_app/models/articles.dart';

// News is the model class for receiving api data.
// It will parse the json of the answer and assign the item list to our model class Items.

class News {
  final int totalResults;

  // Our articles will be manipulated as a List
  final List<Articles> articles;

  // The News constructor
  News({this.totalResults, this.articles});

  // Factory Method lets a class defer instantiation to subclasses.
  factory News.fromJson(Map<String, dynamic> json) {
    var list = json['articles'] as List;
    List<Articles> articlesList = list.map((i) => Articles.fromJson(i)).toList();

    // Return the instance of News, by assigning the data to the variables in the class.
    return News(
      totalResults: json['totalResults'] as int,
      articles: articlesList,
    );
  }
}
