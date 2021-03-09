import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_app/custom_widgets/article_card.dart';
import 'package:flutter_app/models/news.dart';
import 'package:flutter_app/controllers/news_api_controller.dart';

class FavoriteArtciles extends StatefulWidget {
  @override
  _FavoriteArtciles createState() => _FavoriteArtciles();
}

class _FavoriteArtciles extends State<FavoriteArtciles> {

  bool _isLoading = false;

  News _news;

  NewsApiController _apiController = NewsApiController();

  @override
  void initState() {
    super.initState();
    _fetchFavContent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // If the loading is finished we display the List of our news widgets. Otherwise we will display a loading icon.
      body: _isLoading ? Center(child: CircularProgressIndicator()) : Center(
        // ListView is a fake List that will show the way that we will display our news cards.
        child: ListView.separated(
            itemCount: _news.articles.length,
            separatorBuilder: (BuildContext context, int index) => const Divider(),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  height: 500,
                  child: Center(child: ArticleCard(articles: _news.articles[index], index: index))
              );
            }
        ),
      ),
    );
  }

  _fetchFavContent() async {
    // We setup the loading during the request.
    setState(() {
      _isLoading = true;
    });

    // Then we try to get the Api datas
    try {
      // Making the request and save it in a temporary variable
      var news = await _apiController.getTopHeadlines();

      // Then we set the state of our News class instance with the api datas.
      setState(() {
        _news = news;
      });
    } catch(err) {
      // Error managing here.
      setState(() {
        _news = null;
      });
    } finally {
      // Finally we stop the loading icon.
      setState(() {
        _isLoading = false;
      });
    }

  }
}

