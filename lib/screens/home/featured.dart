import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../models/article.dart';

class HomeFeatured extends StatelessWidget
{
    final Article article;

    HomeFeatured(this.article);

    @override
    Widget build(BuildContext context) {
        final _imageCover = SizedBox(
            child: article.image != null ?
                FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: article.image,
                    height: 200.0,
                    fit: BoxFit.cover,
                )
            : null,
        );

        final _title = Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
                article.title,
                style: TextStyle(
                    fontSize: 20.0,
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
                    children: <Widget>[
                        Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                    _imageCover,
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
