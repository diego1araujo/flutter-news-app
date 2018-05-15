import 'package:flutter/material.dart';
import './cell_detail.dart';

class ArticleDetail extends StatelessWidget
{
  final article;

  ArticleDetail(this.article);

  @override
    Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text(article['title']),
        ),
        body: new Center(
          child: new ArticleDetailCell(article),
        ),
      );
    }
}
