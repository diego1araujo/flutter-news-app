import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart';

class DetailCell extends StatelessWidget
{
    final article;

    DetailCell(this.article);

    @override
    Widget build(BuildContext context) {
        final bool existsImage = article['urlToImage'] != null;

        final _published = new Padding(
            padding: new EdgeInsets.only(bottom: 8.0),
            child: new Text(
                'Published ' + timeAgo(DateTime.parse(article['publishedAt'])),
                style: new TextStyle(
                    color: Colors.grey[500],
                ),
            ),
        );

        final _title = new Padding(
            padding: new EdgeInsets.only(bottom: 10.0),
            child: new Text(
                article['title'],
                style: new TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                ),
            ),
        );

        final _imageCover = existsImage ? new SizedBox(
            child: new Image.network(article['urlToImage']),
        ) : null;

        final _description = new Padding(
            padding: new EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: new Text(
                article['description'],
                style: new TextStyle(
                    fontSize: 14.0,
                ),
            ),
        );

        return new Column(
            children: <Widget>[
                new Container(
                    padding: new EdgeInsets.all(10.0),
                    child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                            _published,
                            _title,
                            _imageCover,
                            _description,
                        ],
                    ),
                ),
            ],
        );
    }
}
