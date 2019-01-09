import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';
import 'package:connectivity/connectivity.dart';

import './normal.dart';
import './featured.dart';
import '../detail/page.dart';

const request = 'https://newsapi.org/v2/everything?sources=cbs-news&apiKey=ac9ed44be725499e8d20dd80d113750f';

class HomePage extends StatefulWidget {
    @override
    _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    String _connectionStatus = 'Unknown';
    final Connectivity _connectivity = Connectivity();

    Future<Map> _fetchData() async {
        http.Response response = await http.get(request);

        return json.decode(response.body);
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
            onLongPress: () {
                Share.share(article["url"]);
            },
        );
    }

    Widget _homeLayout() {
        if (_connectionStatus != 'Unknown' && _connectionStatus != 'ConnectivityResult.none') {
            return _futureBuilder();
        }

        return _errorMessage("Outch! It seems that you are offline.\nPlease check your internet connection.");
    }

    Widget _listView(context, snapshot) {
        return ListView.builder(
            itemCount: snapshot.data["articles"] == null ? 0 : snapshot.data["articles"].length,
            itemBuilder: (BuildContext context, int index) {
                return _createGestureDetector(context, index, snapshot.data["articles"][index]);
            },
        );
    }

    Widget _futureBuilder() {
        return Expanded(
            child: RefreshIndicator(
                onRefresh: _fetchData,
                child: FutureBuilder(
                    future: _fetchData(),
                    builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                            if (snapshot.hasError) {
                                return _errorMessage("We're sorry something went wrong :(");
                            }

                            return _listView(context, snapshot);
                        }

                        return Center(
                            child: CircularProgressIndicator(),
                        );
                    },
                ),
            ),
        );
    }

    Widget _errorMessage(String text) {
        return Container(
            padding: EdgeInsets.all(15.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    Text(
                        text,
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                        ),
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

        if (_connectionStatus != 'Unknown' && _connectionStatus != 'ConnectivityResult.none') {
            _fetchData();
        }
    }

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "News App",
            theme: ThemeData(
                primarySwatch: Colors.teal,
                hintColor: Colors.teal[200],
            ),
            home: Scaffold(
                backgroundColor: Colors.grey[100],
                appBar: AppBar(
                    title: Text("News App"),
                    actions: <Widget>[
                        IconButton(
                            icon: Icon(Icons.refresh),
                            onPressed: _fetchData,
                        ),
                    ],
                ),
                body: Container(
                    child: Column(
                        children: <Widget>[
                            _homeLayout(),
                        ],
                    ),
                ),
            ),
        );
    }
}
