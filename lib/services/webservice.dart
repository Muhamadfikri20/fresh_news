import 'dart:convert';

import 'package:fresh_news/models/newsArticle.dart';
import 'package:http/http.dart' as http;

class Webservice {
  Future<List<NewsArticle>> fetchTopHeadlines() async {
    String url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=f9e23beb66de41db8a058fd5610692be";
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["articles"];
      return list.map((article) => NewsArticle.fromJSON(article)).toList();
    } else {
      throw Exception("Failed to get top news");
    }
  }
}
