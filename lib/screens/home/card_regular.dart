import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../style.dart';
import '../../models/post.dart';

class CardRegular extends StatelessWidget
{
    final Post post;

    CardRegular(this.post);

    @override
    Widget build(BuildContext context) {
        final _imageCover = post.image != null ?
            FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: post.image,
                width: 160.0,
                height: 110.0,
                fit: BoxFit.cover,
            ) : null;

        final _published = Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 5.0,
            ),
            child: Text(
                post.date,
                style: publishedHomeNormal,
            ),
        );

        final _title = Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 5.0,
            ),
            child: Text(
                post.title,
                style: titleHomeNormal,
            ),
        );

        return Container(
            padding: const EdgeInsets.all(8.0),
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
