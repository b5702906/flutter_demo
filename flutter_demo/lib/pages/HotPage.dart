import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo/common/PictureConfig.dart';
import 'package:flutter_demo/widget/FunEntry.dart';

class HotPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HotPageState();
  }
}

class HotPageState extends State<HotPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RefreshIndicator(
    onRefresh: _refresh,
        child:new ListView.builder(
            itemBuilder: (BuildContext context,int index){
              return Column(
                children: <Widget>[
                  new Container(
                      height: 200.0,
                      child: new PageView.custom(
                        childrenDelegate: new SliverChildBuilderDelegate(
                              (context, index) {
                            return new Center(
                              child: new Image.asset(PictureConfig.pictureUrl[index]),
                            );
                          },
                          childCount: PictureConfig.pictureUrl.length,
                        ),
                      )),
                  new Container(
                      alignment: Alignment.center,
                      height: 150.0,
                      width: 300.0,
                      child: new PageView.custom(
                        childrenDelegate:
                        new SliverChildBuilderDelegate((context, index) {
                          if (index == 0) {
                            return new Container(
                                alignment: FractionalOffset.center,
                                child:FunEntryPageOne()
                            );
                          } else if (index == 1) {
                            return new Container(
                                alignment: FractionalOffset.center,
                                child:FunEntryPageTwo()
                            );
                          }
                        }, childCount: 2),
                      ))
                ],
              );
            },
           itemCount: 1, )
    );
  }
   Future<Null> _refresh() async{
      print(11111);
  }

}
