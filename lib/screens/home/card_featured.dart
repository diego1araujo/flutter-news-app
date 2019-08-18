import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../style.dart';
import '../../models/post.dart';

class CardFeatured extends StatelessWidget
{
    final Post post;

    CardFeatured(this.post);

    @override
    Widget build(BuildContext context) {
        final _imageCover = Container(
            child: post.image != null ?
                FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: post.image,
                    height: 220.0,
                    fit: BoxFit.cover,
                ) : null,
            );

        final _title = Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
                post.title,
                style: titleHomeFeatured,
            ),
        );

        return Container(
            padding: const EdgeInsets.only(
                left: 8.0,
                top: 15.0,
                right: 8.0,
                bottom: 8.0,
            ),
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
