import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../main.dart';
import './cell.dart';
import './detail.dart';

class NewsAppState extends State<NewsApp> {
  var articles;

  void _fetchData() async {
    final apiKey = 'ac9ed44be725499e8d20dd80d113750f';
    final url = 'https://newsapi.org/v2/everything?sources=cbs-news&apiKey=$apiKey';

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final map = json.decode(response.body);

      setState(() {
        // _isLoading = false;
        this.articles = map['articles'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _fetchData();

    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("News Flutter App"),
        ),
        body: new Center(
          child: new ListView.builder(
              itemCount: this.articles != null ? this.articles.length : 0,
              itemBuilder: (context, i) {
                final article = this.articles[i];

                return new FlatButton(
                  padding: new EdgeInsets.all(0.0),
                  child: new ArticleCell(article),
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) => new ArticleDetail(article),
                      ),
                    );
                  },
                );
              },
          ),
        ),
      ),
    );
  }
}
