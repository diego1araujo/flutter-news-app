import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';
import 'package:connectivity/connectivity.dart';

import '../style.dart';
import './normal.dart';
import './featured.dart';
import '../detail/page.dart';
import '../../models/article.dart';

const request = 'https://newsapi.org/v2/everything?sources=cbs-news&apiKey=ac9ed44be725499e8d20dd80d113750f';

class HomePage extends StatefulWidget {
    @override
    _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    String _connectionStatus = 'Unknown';
    final Connectivity _connectivity = Connectivity();

    Future<List<Article>> _fetchData() async {
        http.Response response = await http.get(request);

        if (response.statusCode == 200) {
            List articles = json.decode(response.body)['articles'];

            return articles.map((json) => new Article.fromJson(json)).toList();
        }

        throw Exception('Something went wrong');
    }

    Future<Null> initConnectivity() async {
        String connectionStatus;

        try {
            connectionStatus = (await _connectivity.checkConnectivity()).toString();
        } catch (e) {
            connectionStatus = 'Unknown';
        }

        setState(() {
            _connectionStatus = connectionStatus;
        });
    }

    Widget _homeLayout() {
        if (_connectionStatus != 'Unknown' && _connectionStatus != 'ConnectivityResult.none') {
            return Container(
                child: Column(
                    children: <Widget>[
                        Expanded(
                            child: _futureListView(),
                        ),
                    ],
                ),
            );
        }

        return _errorMessage('Outch! It seems that you are offline.\nPlease check your internet connection.');
    }

    FutureBuilder _futureListView() {
        return FutureBuilder(
            future: _fetchData(),
            builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                        return _errorMessage('We\'re sorry something went wrong :(');
                    }

                    return ListView.builder(
                        itemCount: snapshot.data == null ? 0 : snapshot.data.length,
                        itemBuilder: (context, index) => _createGestureDetector(context, index, snapshot.data[index]),
                    );
                }

                return Center(
                    child: CircularProgressIndicator(),
                );
            },
        );
    }

    Widget _createGestureDetector(context, index, article) {
        return GestureDetector(
            child: index == 0 ? HomeFeatured(article) : HomeNormal(article),
            onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPage(article),
                    ),
                );
            },
            onLongPress: () => Share.share(article.url),
        );
    }

    Widget _errorMessage(String text) {
        return Container(
            width: double.infinity,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                    Text(
                        text,
                        style: errorMessage,
                    ),
                ],
            ),
        );
    }

    @override
    void initState() {
        super.initState();
        initConnectivity();

        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
            setState(() {
                _connectionStatus = result.toString();
            });
        });
    }

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'News App',
            theme: ThemeData(
                fontFamily: 'SegoeUI',
                primarySwatch: Colors.indigo,
                hintColor: Colors.indigo[400],
            ),
            home: Scaffold(
                backgroundColor: Colors.grey[100],
                appBar: AppBar(
                    title: Text('News App'),
                    actions: <Widget>[
                        IconButton(
                            icon: Icon(Icons.refresh),
                            onPressed: () {
                                setState(() {
                                    _fetchData();
                                });
                            },
                        ),
                    ],
                ),
                body: _homeLayout(),
            ),
        );
    }
}
