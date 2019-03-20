import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget FunEntryPageOne() {
  return Column(
    children: <Widget>[
           Row(
            children: <Widget>[
              Tab(
                text: "限时秒杀",
                icon: Icon(Icons.add_alarm),
              ),
              Tab(
                text: "断码清仓",
                icon: Icon(Icons.add_alarm),
              ),
              Tab(
                text: "品牌馆",
                icon: Icon(Icons.add_alarm),
              ),
              Tab(
                text: "多多果园",
                icon: Icon(Icons.add_alarm),
              ),
              Tab(
                text: "9块9特卖",
                icon: Icon(Icons.add_alarm),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Tab(
                text: "充值中心",
                icon: Icon(Icons.add_alarm),
              ),
              Tab(
                text: "每日好店",
                icon: Icon(Icons.add_alarm),
              ),
              Tab(
                text: "现金签到",
                icon: Icon(Icons.add_alarm),
              ),
              Tab(
                text: "金猪赚大钱",
                icon: Icon(Icons.add_alarm),
              ),
              Tab(
                text: "电器城",
                icon: Icon(Icons.add_alarm),
              )
            ],
          )
    ],
  );
}

Widget FunEntryPageTwo() {
  return Column(
    children: <Widget>[
      Row(
        children: <Widget>[
          Tab(
            text: "限时秒杀",
            icon: Icon(Icons.access_alarm),
          ),
          Tab(
            text: "断码清仓",
            icon: Icon(Icons.account_circle),
          ),
          Tab(
            text: "品牌馆",
            icon: Icon(Icons.add_comment),
          ),
          Tab(
            text: "多多果园",
            icon: Icon(Icons.tab),
          ),
          Tab(
            text: "9块9特卖",
            icon: Icon(Icons.add_circle),
          )
        ],
      ),
      Row(
        children: <Widget>[
          Tab(
            text: "充值中心",
            icon: Icon(Icons.first_page),
          ),
          Tab(
            text: "每日好店",
            icon: Icon(Icons.assignment_ind),
          ),
          Tab(
            text: "现金签到",
            icon: Icon(Icons.arrow_drop_down),
          ),
          Tab(
            text: "金猪赚大钱",
            icon: Icon(Icons.assignment_return),
          ),
          Tab(
            text: "电器城",
            icon: Icon(Icons.border_left),
          )
        ],
      )
    ],
  );
}
