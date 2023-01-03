import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {'/': (context) => STWidgetState()},
    );
  }
}

class STWidgetState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return STWidgetTest();
  }
}

class STWidgetTest extends State<STWidgetState> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('加减练习'),
      ),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[_getButtons(), Text('当前计数:${_count}')],
        ),
      ),
    );
  }

  Widget _getButtons() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      RaisedButton(
        child: Text(
          '加',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        color: Colors.orange,
        onPressed: () {
          if (Platform.isAndroid) {
            setState(() {
              _count++;

            });
          } else {
          }
        },
      ),
      RaisedButton(
        child: Text(
          '减',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        color: Colors.blue,
        onPressed: () {
          setState(() {
            if (_count > 0) {

              _count--;
            }
          });
        },
      )
    ]);
  }
}
