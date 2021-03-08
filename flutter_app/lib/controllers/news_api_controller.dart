import 'dart:convert';

import 'package:flutter_app/network/news_api_calls.dart';
import 'package:flutter_app/models/news.dart';

// Some constant strings to make our api calls
const String URL_EVERYTHING = "http://newsapi.org/v2/everything?";
const String URL_TOP_HEADLINES = "http://newsapi.org/v2/top-headlines?";
const String COUNTRY = "country=fr&";
const String API_KEY = "apiKey=36cb3a17beaa4169bb99ff9fc8118563";


// Our controller class for api calls. The controller will make the http request and send the answer to our models.

class NewsApiController {

  // Future-type function to retrieve and send the current headlines to our News model.
  Future<News> getTopHeadlines() async {
    var response = await NewsApiCalls().get(URL_TOP_HEADLINES + COUNTRY + API_KEY);

    // We extract and decode the Json response to make it usable by Flutter.
    return News.fromJson(jsonDecode(response));
  }

}