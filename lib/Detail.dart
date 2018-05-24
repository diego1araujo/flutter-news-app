import 'package:flutter/material.dart';
import 'DetailCell.dart';

class Detail extends StatelessWidget
{
    final article;

    Detail(this.article);

    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            appBar: new AppBar(
                title: new Text(article['title']),
            ),
            body: new Center(
                child: new DetailCell(article),
            ),
        );
    }
}
