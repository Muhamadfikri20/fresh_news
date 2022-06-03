import 'package:flutter/material.dart';
import 'package:fresh_news/viewmodels/newsArticleListViewModel.dart';
import 'package:fresh_news/widgets/newsList.dart';
import 'package:provider/provider.dart';

class NewsListPage extends StatefulWidget {
  @override
  State<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  final _controller = TextEditingController();
  @override
  void initState() {
    super.initState();

    Provider.of<NewsArticleListViewModel>(context, listen: false).populateTopHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsArticleListViewModel>(context);

    return Scaffold(
        appBar: AppBar(title: Text("Top News")),
        body: Column(children: <Widget>[
          TextField(
            controller: _controller,
            onSubmitted: (value) {
              // fetch all the news related to the keyword
            },
            decoration: InputDecoration(
                labelText: "Enter search term",
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.search),
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _controller.clear();
                  },
                )),
          ),
          Expanded(child: NewsList(articles: vm.articles))
        ]));
  }
}
