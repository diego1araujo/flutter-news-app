import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:transparent_image/transparent_image.dart';

import '../style.dart';
import '../../models/post.dart';

class DetailPage extends StatelessWidget
{
    final Post post;

    DetailPage(this.post);

    @override
    Widget build(BuildContext context) {
        final _title = Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
                post.title,
                style: titleDetail,
            ),
        );

        final _published = Padding(
            padding: const EdgeInsets.only(
                left: 20.0,
                bottom: 7.0,
            ),
            child: Text(
                'Published ' + timeago.format(DateTime.parse(post.date), locale: 'en'),
                style: publishedDetail,
            ),
        );

        final _imageCover = Container(
            child: post.image != null ?
                FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: post.image,
                    width: double.infinity,
                    height: 230.0,
                    fit: BoxFit.cover,
                )
            : null,
        );

        final _description = Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
                post.description,
                style: descriptionDetail,
            ),
        );

        return Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
                actions: <Widget>[
                    IconButton(
                        icon: Icon(Icons.share),
                        onPressed: () => Share.share(post.url),
                    ),
                ],
            ),
            body: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                        _title,
                        _published,
                        _imageCover,
                        _description,
                    ],
                ),
            ),
        );
    }
}
