import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:transparent_image/transparent_image.dart';

import '../../models/article.dart';
import '../style.dart';

class HomeNormal extends StatelessWidget
{
    final Article article;

    HomeNormal(this.article);

    @override
    Widget build(BuildContext context) {
        final _imageCover = article.image != null ?
            FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: article.image,
                width: 160.0,
                height: 110.0,
                fit: BoxFit.cover,
            ) : null;

        final _published = Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
            child: Text(
                timeago.format(DateTime.parse(article.date), locale: 'en'),
                style: publishedHomeNormal,
            ),
        );

        final _title = Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
            child: Text(
                article.title,
                style: titleHomeNormal,
            ),
        );

        return Container(
            padding: const EdgeInsets.all(3.0),
            child: Card(
                elevation: 2.0,
                child: IntrinsicHeight(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                            Container(
                                child: _imageCover,
                            ),
                            Expanded(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                        _published,
                                        _title,
                                    ],
                                ),
                            ),
                        ],
                    ),
                ),
            ),
        );
    }
}
