import 'dart:io';

import 'dart:convert';
int cid=1;
Future<Map<String,dynamic>> getAsyncData() async {

  String url = 'http://apis.juhe.cn/cook/index?key=47b22e1f7ae5bb84fe94f933f94da386&cid=$cid';
  cid++;
  var httpClient = new HttpClient();
  try {
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();                         // 得到是 buffer 数据
    var jsonstr = await response.transform(utf8.decoder).join();
    Map<String, dynamic> data = json.decode(jsonstr);
   return data;                         // 像对象一个调用
  } catch (err) {
    print('error' + err.toString());
  }
}