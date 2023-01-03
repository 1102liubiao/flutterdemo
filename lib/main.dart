import 'dart:io';

import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import 'HomePage.dart';
import 'PersonPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        initialRoute: '/',
        routes: {'/': (context) => STWidgetState()},
      ),
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
  int _currentIndex=0;
  PageController _pageController;
  final List<Widget> pages=[HomePage(),PersonPage()];
  @override
  void initState() {
    // TODO: implement initState
    _pageController=PageController(initialPage: _currentIndex);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('加减练习'),
        backgroundColor: Colors.pink,
      ),
      // body: new Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[_getButtons(), Text('当前计数:${_count}')],
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.add_home,color:Colors.grey),
            activeIcon: Icon(Icons.add_home,color: Colors.red,),
            label:'主页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_home,color:Colors.grey),
            activeIcon: Icon(Icons.add_home,color: Colors.red,),

            label:'我的',
          )
        ],
        currentIndex: _currentIndex,
        onTap: (index){
          _changePage(index);

        },
      ),
      body: pages[_currentIndex],

    );
  }
  void _changePage(int index){
    if (index!=_currentIndex) {
      setState(() {
        _currentIndex=index;
      });
    }
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
