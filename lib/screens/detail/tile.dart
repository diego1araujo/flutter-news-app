import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:transparent_image/transparent_image.dart';

class DetailTile extends StatelessWidget
{
    final article;

    DetailTile(this.article);

    @override
    Widget build(BuildContext context) {
        final bool isImageExists = article["urlToImage"] != null;

        final _title = Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
                article["title"],
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                ),
            ),
        );

        final _published = Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
                "Published " + timeago.format(DateTime.parse(article["publishedAt"]), locale: "en"),
                style: TextStyle(
                    color: Colors.grey[500],
                ),
            ),
        );

        final _imageCover = SizedBox(
            child: isImageExists ?
                FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: article["urlToImage"],
                    width: double.infinity,
                    height: 200.0,
                    fit: BoxFit.cover,
                )
            : null,
        );

        final _description = Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Text(
                article["description"],
                style: TextStyle(
                    fontSize: 14.0,
                ),
            ),
        );

        return Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                    _title,
                    _published,
                    _imageCover,
                    _description,
                ],
            ),
        );
    }
}
