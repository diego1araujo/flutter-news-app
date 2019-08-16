import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadPage extends StatelessWidget {
    Widget _lines(context) {
        return Container(
            width: MediaQuery.of(context).size.width - 155.0,
            height: 10.0,
            color: Colors.grey,
        );
    }

    @override
    Widget build(BuildContext context) {
        return ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index) => Shimmer.fromColors(
                baseColor: Colors.grey[400],
                highlightColor: Colors.white,
                child: Container(
                    margin: EdgeInsets.all(10.0),
                    child: IntrinsicHeight(
                        child: Row(
                            children: <Widget>[
                                Container(
                                    width: 120.0,
                                    height: 100.0,
                                    margin: EdgeInsets.only(
                                        right: 15.0,
                                    ),
                                    color: Colors.blue,
                                ),
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                        _lines(context),
                                        _lines(context),
                                        _lines(context),
                                        _lines(context),
                                    ],
                                ),
                            ],
                        ),
                    ),
                ),
            ),
        );
    }
}
