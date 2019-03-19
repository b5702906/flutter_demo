import 'package:flutter/widgets.dart';
import 'package:flutter_demo/common/PictureConfig.dart';

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
     return  Column(
        children: <Widget>[
          new Container(
          height: 200.0,
          child:new PageView.custom(
            childrenDelegate: new SliverChildBuilderDelegate(
                  (context, index) {
                return new Center(
                  child: new Image.asset(PictureConfig.pictureUrl[index]),
                );
              },
              childCount: PictureConfig.pictureUrl.length,
            ),
          )
          ),
        ],
    );
  }
}
