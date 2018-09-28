import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:transparent_image/transparent_image.dart';

class HomeCell extends StatelessWidget
{
    final article;

    HomeCell(this.article);

    @override
    Widget build(BuildContext context) {
        final bool isImageExists = article["urlToImage"] != null;

        final _imageCover = SizedBox(
            child: isImageExists ?
                FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: article["urlToImage"],
                    height: 200.0,
                    fit: BoxFit.cover
                )
            : null,
        );

        final _published = Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
                "Published " + timeago.format(DateTime.parse(article["publishedAt"]), locale: "en"),
                style: TextStyle(
                    color: Colors.grey[500],
                ),
            ),
        );

        final _title = Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
                article["title"],
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                ),
            ),
        );

        return Container(
            padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 10.0),
            child: Card(
                elevation: 5.0,
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
            ),
        );
    }
}
