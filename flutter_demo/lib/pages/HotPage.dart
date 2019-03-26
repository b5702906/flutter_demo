import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo/api/HttpParse.dart';
import 'package:flutter_demo/common/PictureConfig.dart';
import 'package:flutter_demo/models/NewsInfo.dart';
import 'package:flutter_demo/widget/DisplayList.dart';
import 'package:flutter_demo/widget/FunEntry.dart';

class HotPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HotPageState();
  }
}

class HotPageState extends State<HotPage> {
  ScrollController _scrollController = ScrollController();
  bool isLoading=false;
  static List<NewsInfo> list = [
    NewsInfo(
        'http:\/\/img.juhe.cn\/cookbook\/t\/0\/45_854851.jpg',
        '秘制红烧肉',
        '家常菜;热菜;烧;煎;炖;红烧;炒锅',
        '玫瑰腐乳,适量;盐,适量;八角,适量;草果,适量;香叶,适量;料酒,适量;米醋,适量;生姜,适量'),
    NewsInfo(
        'http:\/\/img.juhe.cn\/cookbook\/t\/1\/52_759155.jpg',
        '经典红烧肉',
        '家常菜;咸;半小时-1小时;孕妇;青少年;老人;白领;晚餐;红烧;营养;增强抵抗力;全菜系;1-2人;待客菜;锅子',
        '葱,适量;姜,适量;蒜,适量;八角,2粒;桂皮,1块;干辣椒,1个;酱油,适量;冰糖,适量;盐,适量;料酒,适量'),
    NewsInfo(
        'http:\/\/img.juhe.cn\/cookbook\/t\/1\/92_512827.jpg',
        '红烧肉',
        '家常菜;快手菜',
        '葱段,适量;八角,2个;干辣椒,4个;香叶,4片;桂皮,1块;鲜姜,1块;干山楂片,4片;黄油,适量;老抽,适量;生抽,适量;白糖,适量;开水,适量'),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print(list.length);
    _scrollController.addListener((){
      if(_scrollController.position.pixels==_scrollController.position.maxScrollExtent&&isLoading==false){
        _getMore();
      }
    }
    );
    return RefreshIndicator(
        onRefresh: _refresh,
        child: new CustomScrollView(
          controller: _scrollController,
          shrinkWrap: true,
          slivers: <Widget>[
            SliverPadding(
              padding: EdgeInsets.all(0.0),
              sliver: SliverList(
                delegate: new SliverChildListDelegate(
                  <Widget>[
                    new Container(
                        height: 200.0,
                        child: new PageView.custom(
                          childrenDelegate: new SliverChildBuilderDelegate(
                            (context, index) {
                              return new Center(
                                child: new Image.asset(
                                    PictureConfig.pictureUrl[index]),
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
                                  padding: EdgeInsets.only(left: 30.0),
                                  alignment: FractionalOffset.center,
                                  child: FunEntryPageOne());
                            } else if (index == 1) {
                              return new Container(
                                  padding: EdgeInsets.only(left: 30.0),
                                  alignment: FractionalOffset.center,
                                  child: FunEntryPageTwo());
                            }
                          }, childCount: 2),
                        )),
                    new Container(
                      height: (list.length * 200.0+100.0),
                      child: new ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          if(index==list.length){
                            return getMoreWidget();
                          }
                          return getDisplay(list[index]);
                        },

                        physics: NeverScrollableScrollPhysics(),
                        itemCount: list.length+1,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Future<Null> _refresh() async {
    list.clear();
    getAsyncData().then((Map<String, dynamic> map) {
      for (Map<String, dynamic> res in map['result']['data']) {
        print(res['albums'][0]);
        list.add(NewsInfo(res['albums'][0], res['title'].toString(),
            res['tags'].toString(), res['burden'].toString()));
      }
      setState(() {});
    });
  }

  void _getMore() async{
      getAsyncData().then((Map<String, dynamic> map) {
        for (Map<String, dynamic> res in map['result']['data']) {
          print(res['albums'][0]);
          list.add(NewsInfo(res['albums'][0], res['title'].toString(),
              res['tags'].toString(), res['burden'].toString()));
        }
        isLoading=false;
        setState(() {});
      });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }
}
