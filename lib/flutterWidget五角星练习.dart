import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

import 'Pentagram.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {'/': (context) => GridViewTest()},
    );
  }
}
/**
 * future的基本用法
 */
// Future<String> getNetWorkValue(){
//   return Future<String>((){
//     sleep(Duration(
//         seconds: 5
//     ));
//     return '耗时操作';
//   });
//
//
// }
/// await必须满足两个条件
/// 1.必须再async函数里才能使用。
/// 2.async必须返回一个future
Future getNetWorkValue() async {
  await sleep(Duration(seconds: 3));
  return '返回结果';
}

class GridViewTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("开始");
    getNetWorkValue().then((value) {
      print(value);
    });


    print('结束');
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('GridView练习'),
      // ),star_outlined
      body: Center(
        child:Center(
          child: ListView.builder(itemBuilder:(BuildContext context,int index){
            return Icon(Icons.star_purple500_sharp,color: Colors.red,);
          },
            itemCount: 5,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_upward),
      ),
    );
  }
}

Widget getWjx() {
  return CustomPaint(

    painter: Pentagram(Color(0xFFFF504C)),
  );
}

class HTStarRating extends StatefulWidget {
  final double rating; // 当前分数
  final double maxRating; // 满分
  final int count; // 总共几颗心
  final double size; // 星星大小
  final Color defaultColor;
  final Color selectedColor;
  final Widget unselectedImage;
  final Widget selectedImage;

  HTStarRating({
    @required this.rating, // 必填
    //选填， 初始默认值
    this.maxRating = 10,
    this.count = 5,
    this.size = 30,
    this.defaultColor = Colors.grey,
    this.selectedColor = Colors.red,
    Widget unselectedImage,
    Widget selectedImage,


  })
      :unselectedImage = unselectedImage ?? Icon(
      Icons.star_border, color: defaultColor, size: size),
        selectedImage = selectedImage ??
            Icon(Icons.star, color: selectedColor, size: size);

  @override
  _HTStarRatingState createState() => _HTStarRatingState();
}

class _HTStarRatingState extends State<HTStarRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(
            mainAxisSize: MainAxisSize.min,
            children: buildDefaultStar()
        ),
        Row(
            mainAxisSize: MainAxisSize.min,
            children: buildSelectedStar()
        )
      ],
    );
  }


  /*
  *  创建默认的星星
  * */
  List<Widget> buildDefaultStar() {
    return List.generate(widget.count, (index) {
      return widget.unselectedImage;
    });
  }

  /*
  *  创建选中的星星
  * */
  List<Widget> buildSelectedStar() {
    // 创建stats
    List<Widget> starts = [];
    final star = widget.selectedImage;
    //构建满的start
    double oneValue = widget.maxRating / widget.count;
    int entireCount = (widget.rating / oneValue).floor(); //.floor() 向下取整

    for (var i = 0; i < entireCount; i++) {
      starts.add(star);
    }
    //构建部分start
    double leftWidth = ((widget.rating / oneValue) - entireCount) * widget.size;
    final halfStar = ClipRect(
        clipper: HTStartClipper(leftWidth),
        child: star
    );
    starts.add(halfStar);

    // 防止传入参数大于总分
    if (starts.length > widget.count) {
      return starts.sublist(0, widget.count);
    }

    return starts;
  }
}

/*
* 切割
* */
class HTStartClipper extends CustomClipper<Rect> {

  double width;

  HTStartClipper(this.width);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, width, size.height);
  }

  @override
  bool shouldReclip(HTStartClipper oldClipper) {
    return oldClipper.width != this.width;
  }
}

Widget _getSliver() {
  NotificationListener( //滚动监听
    onNotification: (ScrollNotification notification) {
      if (notification is ScrollStartNotification) {
        print("开始滚动了.........");
      } else if (notification is ScrollUpdateNotification) {
        print("正在滚动了.........当前位置${notification.metrics}"); //滚动的当前位置

      } else if (notification is ScrollEndNotification) {
        print("结束滚动了.........");
      }
      return true;
    },

    child: CustomScrollView( //用于做
      slivers: [
        SliverAppBar(
          pinned: true, //顶部是否跟随滚动
          expandedHeight: 300, //顶部高度
          flexibleSpace: FlexibleSpaceBar( //顶部布局
            title: Text('刘彪'),
            // background: Image.network('https://tiebapic.baidu.com/forum/w%3D580%3B/sign=18e3a4d5de177f3e1034fc0540f43ac7/962bd40735fae6cdb2a29d0218b30f2442a70fba.jpg?tbpicau=2022-06-07-05_1f45390745359ddfff6c3e6ab2758361',
            //   fit: BoxFit.cover,),
          ),

        ),
        SliverSafeArea( //这是用于沉浸式相当于

          sliver: SliverPadding( //这是列表的内边距
            padding: EdgeInsets.all(8),
            sliver: SliverGrid( //Grid列表

              delegate: SliverChildBuilderDelegate( //用于显示item布局
                      (BuildContext context, int aaa) {
                    return Container(
                      color: Color.fromARGB(
                          255, Random().nextInt(256), Random().nextInt(256),
                          Random().nextInt(256)),

                    );
                  },
                  childCount: 15
              ),

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( //用于控制边距，一行显示的个数
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1.8,


              ),

            ),

          ),


        ),
        // Text('这是分割线'),

        SliverList( //这是listview
            delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return ListTile(
                    leading: Icon(Icons.people),
                    title: Text("联系人$index"),
                  );
                },
                childCount: 20
            )
        ),

      ],
    ),
  );
}

///这是GridView的显示
// Padding(
//
// padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 0),
// child: GridView(
// gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
// maxCrossAxisExtent: 200,
// crossAxisSpacing: 8,
// mainAxisSpacing: 8
// ),
//
// children: List.generate(100, (index) {
// return Container(
// alignment: Alignment.center,
// child: Text('苏婷'),
// color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256)),
// );
// }),
// ),
// )