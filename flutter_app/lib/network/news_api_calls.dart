import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;


// NewsApiCalls is our network class that will perform our http requests to the API: NewsApi

class NewsApiCalls {

  //A Future type function is declared which will be  initialize later during the runtime.
  //It is an asynchronous function that will return the http callback body.

  Future<String> get(String url) async {

    // We get the response here.
    var response = await http.get(url);

    if (response.statusCode != HttpStatus.ok) throw Exception(response.body);

    log('Network = ${response.body}');

    // We return the response body after checking if an error occured.
    return response.body;

  }

}