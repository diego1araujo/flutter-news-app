import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomeCell extends StatelessWidget
{
    final article;

    HomeCell(this.article);

    @override
    Widget build(BuildContext context) {
        final bool existsImage = article['urlToImage'] != null;

        final _imageCover = SizedBox(
            child: existsImage ? Image.network(article['urlToImage']) : null,
        );

        final _published = Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
                'Published ' + timeago.format(DateTime.parse(article['publishedAt']), locale: 'en'),
                style: TextStyle(
                    color: Colors.grey[500],
                ),
            ),
        );

        final _title = Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
                article['title'],
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                ),
            ),
        );

        final _createCard = Card(
            elevation: 3.0,
            child: Padding(
                padding: EdgeInsets.all(0.0),
                child: Column(
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

        return Container(
            padding: EdgeInsets.all(5.0),
            child: _createCard,
        );
    }
}
