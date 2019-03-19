import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController topController;
  var bottomController;
  static int focusIndex = 0;
  List<String> tab = [
    "热门",
    '男装',
    '手机',
    '食品',
    '电器',
    '鞋包',
    '女装',
    '骑车',
    '水果',
    '运动',
    '电脑',
    '百货'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: new Material(
          child: new ListView.builder(
              itemCount: tab.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    if (index != focusIndex) {
                      print(index);
                      print(focusIndex);
                      setState(() {
                        focusIndex = index;
                      });
                    }
                  },
                  child: new Container(
                      margin: EdgeInsets.only(left: 10.0, right: 5.0),
                      child: Tab(
                          child: Text(tab[index],
                              style: new TextStyle(
                                  color: focusIndex == index
                                      ? Colors.redAccent
                                      : null)))),
                );
              }),
        ),
      ),
      body: new TabBarView(
        controller: this.topController, //配置控制器
        children: [
          // Tab 内容
          new Text('aaa'),
          new Text('bbb'),
          new Text('ccc'),
          new Text('ddd'),
          new Text('eee'),
        ],
      ),
      bottomNavigationBar: new Material(
        child: new TabBar(
          controller: this.bottomController,
          indicatorColor: Colors.transparent,
          unselectedLabelColor: Colors.white,
          labelColor: Colors.red,
          tabs: <Tab>[
            new Tab(text: '首页'),
            new Tab(text: '推荐'),
            new Tab(text: '搜索'),
            new Tab(text: '聊天'),
            new Tab(text: '个人中心')
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.topController = new TabController(
      vsync: this, // 动画效果的异步处理
      length: 5, // tab 个数
      initialIndex: 0, // 起始位置
    );
    this.bottomController = new TabController(
      vsync: this, // 动画效果的异步处理
      length: 5, // tab 个数
      initialIndex: 0, // 起始位置
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    this.topController = null;
    super.dispose();
  }
}
