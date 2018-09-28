import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:transparent_image/transparent_image.dart';

class DetailCell extends StatelessWidget
{
    final article;

    DetailCell(this.article);

    @override
    Widget build(BuildContext context) {
        final bool isImageExists = article["urlToImage"] != null;

        final _published = Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
                "Published " + timeago.format(DateTime.parse(article["publishedAt"]), locale: "en"),
                style: TextStyle(
                    color: Colors.grey[500],
                ),
            ),
        );

        final _title = Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Text(
                article["title"],
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                ),
            ),
        );

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

        final _description = Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Text(
                article["description"],
                style: TextStyle(
                    fontSize: 14.0,
                ),
            ),
        );

        return Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                    _published,
                    _title,
                    _imageCover,
                    _description,
                ],
            ),
        );
    }
}
