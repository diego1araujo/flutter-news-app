import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

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
                'Published ' + timeago.format(DateTime.parse(article['publishedAt']), locale: 'en'),
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

        final _createCard = new Card(
            elevation: 3.0,
            child: new Padding(
                padding: new EdgeInsets.all(0.0),
                child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                        _imageCover,
                        _published,
                        _title,
                    ],
                ),
            ),
        );

        return new Container(
            padding: new EdgeInsets.all(5.0),
            child: _createCard,
        );
    }
}
