import 'package:flutter/material.dart';
import 'package:share/share.dart';

import '../../models/article.dart';

import './tile.dart';

class DetailPage extends StatelessWidget
{
    final Article article;

    DetailPage(this.article);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
                actions: <Widget>[
                    IconButton(
                        icon: Icon(Icons.share),
                        onPressed: () => Share.share(article.url),
                    ),
                ],
            ),
            body: DetailTile(article),
        );
    }
}
