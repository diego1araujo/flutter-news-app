import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'main.dart';
import 'HomeCell.dart';
import 'Detail.dart';

class NewsAppState extends State<NewsApp>
{
    var articles;

    fetchData() async {
        final apiKey = 'ac9ed44be725499e8d20dd80d113750f';
        final url = 'https://newsapi.org/v2/everything?sources=cbs-news&apiKey=$apiKey';

        final response = await http.get(url);

        if (response.statusCode == 200) {
            final map = json.decode(response.body);

            setState(() {
                this.articles = map['articles'];
            });
        }
    }

    createFlatButton(context, article) {
        return new FlatButton(
            padding: new EdgeInsets.all(0.0),
            child: new HomeCell(article),
            onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new Detail(article),
                    ),
                );
            },
        );
    }

    createListView() {
        return new Center(
            child: new ListView.builder(
                itemCount: this.articles != null ? this.articles.length : 0,
                itemBuilder: (context, i) {
                    return createFlatButton(context, this.articles[i]);
                },
            ),
        );
    }

    @override
    Widget build(BuildContext context) {
        fetchData();

        return new MaterialApp(
            debugShowCheckedModeBanner: false,
            home: new Scaffold(
                appBar: new AppBar(
                    title: new Text("News App"),
                ),
                body: createListView(),
            ),
        );
    }
}
