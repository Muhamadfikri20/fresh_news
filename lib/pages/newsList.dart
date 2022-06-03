

import 'package:flutter/material.dart';
import 'package:fresh_news/viewmodels/newsArticleListViewModel.dart';
import 'package:provider/provider.dart';

class NewsList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final vm = Provider.of<NewsArticleListViewModel>(context);
  
    return Scaffold(
      appBar: AppBar(
        title: Text("Top News")
      ),
      body: ListView.builder(
        itemCount: vm.articles.length,
        itemBuilder: (context, index) {

          final article = vm.articles[index];

          return ListTile(
            leading: Container(
              width: 100,
              height: 100,
              child: article.imageURL == null ? Image.asset("images/news-placeholder.png") : Image.network(article.imageURL)),
            title: Text(article.title),
          );
        },
      )
    );

  }

}