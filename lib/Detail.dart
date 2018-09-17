import 'package:flutter/material.dart';
import 'DetailCell.dart';

class Detail extends StatelessWidget
{
    final article;

    Detail(this.article);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(article['title']),
            ),
            body: Center(
                child: DetailCell(article),
            ),
        );
    }
}
