import 'package:flutter/material.dart';

class ArticleDetailCell extends StatelessWidget {
    final article;

    ArticleDetailCell(this.article);

    @override
    Widget build(BuildContext context) {
        return new Column(
            children: <Widget>[
                new Container(
                    padding: new EdgeInsets.all(16.0),
                    child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                            new Image.network(article['urlToImage']),
                            new Container(height: 8.0),
                            new Text(
                                article['title'],
                                style: new TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                ),
                            ),
                            new Container(height: 8.0),
                            new Text(
                                article['description'],
                                style: new TextStyle(
                                    fontSize: 12.0,
                                ),
                            ),
                        ],
                    ),
                ),
                new Divider(),
            ],
        );
    }
}