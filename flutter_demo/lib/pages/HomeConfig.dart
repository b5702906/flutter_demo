import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage>
    with TickerProviderStateMixin {
  TabController topController;
  var bottomController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: new Material(
            child: new TabBar(
              isScrollable: true,
              controller: this.topController,
              indicatorColor: Colors.transparent,
              unselectedLabelColor: Colors.black45,
              labelColor: Colors.redAccent,
              tabs: <Tab>[
                new Tab(text: '热门'),
                new Tab(text: '男装'),
                new Tab(text: '手机'),
                new Tab(text: '食品'),
                new Tab(text: '电器'),
              ],
            ),
          ),
      ),
      body: new TabBarView(
        controller: this.topController, //配置控制器
        children: [ // Tab 内容
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
    this.bottomController=new TabController(
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
