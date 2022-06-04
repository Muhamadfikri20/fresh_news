import 'package:flutter/material.dart';
import 'package:fresh_news/pages/newsArticleDetailsPage.dart';
import 'package:fresh_news/viewmodels/newsArticleViewModel.dart';

class NewsList extends StatelessWidget {
  final List<NewsArticleViewModel> articles;
  final Function(NewsArticleViewModel article) onSelected;
  NewsList({required this.articles, required this.onSelected});
  void _showNewsArticleDetails(BuildContext context, NewsArticleViewModel article) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => NewsArticleDetailsPage(article: article)));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];

        return ListTile(
          onTap: () {
            _showNewsArticleDetails(context, article);
          },
          leading: Container(width: 100, height: 100, child: article.imageURL == null ? Image.asset("images/news-placeholder.png") : Image.network(article.imageURL)),
          title: Text(article.title),
        );
      },
    );
  }
}
