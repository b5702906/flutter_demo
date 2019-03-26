import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo/models/NewsInfo.dart';

Widget getDisplay(NewsInfo info) {
  print(info.title);
  return Container(
      height: 200.0,
      width: double.infinity,
      child: Row(
        children: <Widget>[
          Container(
              width: 150.0,
              alignment: Alignment.topCenter,
              child: Image.network(
                info.imageUrl,
              )),
          Container(
              width: 200.0,
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.only(bottom: 25.0),
                    child: Text(
                      info.title,
                      maxLines: 3,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: 5.0),
                      child: Text(info.tag,
                          style: new TextStyle(color: Colors.redAccent))),
                  Container(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        info.burden,
                        maxLines: 3,
                      ))
                ],
              ))
        ],
      ));
}
Widget getMoreWidget() {
  return Container(
      height: 100.0,
      child:Center(
    child: Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            '加载中...     ',
            style: TextStyle(fontSize: 16.0),
          ),
          CircularProgressIndicator(strokeWidth: 1.0,)
        ],
      ),
    ),
  )
  );
}

