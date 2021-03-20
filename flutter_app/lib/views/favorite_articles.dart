import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/news_api_controller.dart';
import 'package:flutter_app/models/sharedUserData.dart';
import 'package:flutter_app/models/news.dart';
import 'package:flutter_app/custom_widgets/article_card.dart';
import 'package:flutter_app/models/user.dart';

class FavoriteArticles extends StatefulWidget {

  @override
  _FavoriteArticlesState createState() => _FavoriteArticlesState();

}

class _FavoriteArticlesState extends State<FavoriteArticles> {
  News _news;
  bool _isLoading = false;
  NewsApiController _api = NewsApiController();
  User _user;

  @override
  void initState() {
    super.initState();
    _setupPageResults();
  }

  _setupPageResults() async {
    setState(() {
      _isLoading = true;
    });
    try {
      var isUserExist = User.fromJson(await SharedPrefUser().getUser());
      if (isUserExist != null) {
        setState(() {_user = isUserExist;});
      }
    } catch(err) {
      print("Error !");
    }finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading ? Center(child: CircularProgressIndicator()) : Center(
        child: ListView.separated(
          itemCount: _user.favArticles.length,
          separatorBuilder: (BuildContext context, int index) => const Divider(),
          itemBuilder: (BuildContext context, int index) {
            return Container(
                height: 500,
                child: Center(child: ArticleCard(articles: _user.favArticles[index], index: index, user: _user))
            );
          },
        ),
      ),
    );
  }

}