import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:transparent_image/transparent_image.dart';

import '../../models/article.dart';

class HomeNormal extends StatelessWidget
{
    final Article article;

    HomeNormal(this.article);

    @override
    Widget build(BuildContext context) {
        final _imageCover = SizedBox(
            child: article.image != null ?
                FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: article.image,
                    width: 160.0,
                    height: 110.0,
                    fit: BoxFit.cover,
                )
            : null,
        );

        final _published = Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
            child: Text(
                'Published ' + timeago.format(DateTime.parse(article.date), locale: 'en'),
                style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.blueGrey,
                ),
            ),
        );

        final _title = Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Text(
                article.title,
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.blueGrey[900],
                ),
            ),
        );

        return Container(
            padding: const EdgeInsets.all(3.0),
            child: Card(
                elevation: 2.0,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
        );
    }
}
