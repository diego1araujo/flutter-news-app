import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:transparent_image/transparent_image.dart';

import '../../models/article.dart';
import '../style.dart';

class DetailTile extends StatelessWidget
{
    final Article article;

    DetailTile(this.article);

    @override
    Widget build(BuildContext context) {
        final _title = Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
                article.title,
                style: titleDetail,
            ),
        );

        final _published = Padding(
            padding: const EdgeInsets.only(
                left: 20.0,
                bottom: 7.0,
            ),
            child: Text(
                'Published ' + timeago.format(DateTime.parse(article.date), locale: 'en'),
                style: publishedDetail,
            ),
        );

        final _imageCover = Container(
            child: article.image != null ?
                FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: article.image,
                    width: double.infinity,
                    height: 230.0,
                    fit: BoxFit.cover,
                )
            : null,
        );

        final _description = Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
                article.description,
                style: descriptionDetail,
            ),
        );

        return SingleChildScrollView(
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
