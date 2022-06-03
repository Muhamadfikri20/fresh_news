import 'package:fresh_news/viewmodels/newsArticleViewModel.dart';

import 'package:flutter/material.dart';
import 'package:fresh_news/models/newsArticle.dart';
import 'package:fresh_news/services/webservice.dart';

class NewsArticleListViewModel extends ChangeNotifier {
  List<NewsArticleViewModel> articles = <NewsArticleViewModel>[];

  Future<void> search(String keyword) async {
    List<NewsArticle> newsArticles = await Webservice().fetchHeadlinesByKeyword(keyword);
    this.articles = newsArticles.map((article) => NewsArticleViewModel(article: article)).toList();
    notifyListeners();
  }

  Future<void> populateTopHeadlines() async {
    List<NewsArticle> newsArticles = await Webservice().fetchTopHeadlines();
    this.articles = newsArticles.map((article) => NewsArticleViewModel(article: article)).toList();
    notifyListeners();
  }
}
