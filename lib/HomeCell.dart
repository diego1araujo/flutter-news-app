import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart';

class HomeCell extends StatelessWidget
{
    final article;

    HomeCell(this.article);

    @override
    Widget build(BuildContext context) {
        final bool existsImage = article['urlToImage'] != null;

        final _imageCover = new SizedBox(
            child: existsImage ? new Image.network(article['urlToImage']) : null,
        );

        final _published = new Padding(
            padding: new EdgeInsets.all(8.0),
            child: new Text(
                'Published ' + timeAgo(DateTime.parse(article['publishedAt'])),
                style: new TextStyle(
                    color: Colors.grey[500],
                ),
            ),
        );

        final _title = new Padding(
            padding: new EdgeInsets.all(8.0),
            child: new Text(
                article['title'],
                style: new TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                ),
            ),
        );

        return new Container(
            padding: new EdgeInsets.all(5.0),
            child: new Card(
                elevation: 3.0,
                child: new Padding(
                    padding: new EdgeInsets.all(0.0),
                    child: new Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                            _imageCover,
                            _published,
                            _title,
                        ],
                    ),
                ),
            ),
        );
    }
}
