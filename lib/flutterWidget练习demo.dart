import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      //注册路由表
      initialRoute: "/",
      routes: {
        //二级页路由
        "new_router": (context) => NewRoute(),
        //三级页路由
        "threeList_route": (context) => ThreeListPageRoute(),
        //主函数路由
        "/": (context) => WidgetState()
      },

      // home:WidgetState()
    );
  }
}

class WidgetState extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return StudyWidgetState();
  }
// StudyWidgetState createState() => StudyWidgetState();

}

class StudyWidgetState extends State<WidgetState> {
  bool _switchSelected = true; //维护单选开关状态

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text('欢迎欢迎'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 55.0,
              ),
              Text('刘彪'),
              Image(
                image: AssetImage('images/abc.jpg'),
                width: 100,
              ),
              Switch(
                value: _switchSelected,
                onChanged: (value) {
                  setState(() {
                    _switchSelected = value;
                  });
                },
              ),
              //FlatButton按钮
              RaisedButton(
                  textTheme: ButtonTextTheme.accent,
                  textColor: Colors.red,
                  onPressed: () {
                    //导航到新路由
                    print("点击了");
                    HttpClient httpClient = HttpClient();
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>NewRoute()));
                    Navigator.pushNamed(context, "new_router");
                  },
                  child: Text("路由跳转")),
              LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.yellow),
              ),
              CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.orange),
              ),

              ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: 20.0, //宽度尽可能大
                    minWidth: double.infinity //最小高度
                ),
                child: Container(
                  height: 80.0,
                  child: redBox,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 30.0,
                        color: Colors.red,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 30.0,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          alignment: Alignment.center,
        ),
      ),
    );
  }
}

//定制盒模型
Widget redBox = DecoratedBox(
  decoration: BoxDecoration(color: Colors.red),
);

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var container = new Container(
      child: Container(
        child: Column(
          children: <Widget>[
            Image(
              image: AssetImage('images/abc.jpg'),
              width: 100.0,
              height: 100.0,
            ),

            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text('A'),
              ),
              label: Text("你好啊"),
            ),
            new Text(
              '文字描述这是一个',
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 18.0,
              ),
            ),
            new ListTile(
              leading: new Icon(Icons.access_time),
              title: new Text('这是一个文案'),

            ),
            new ListTile(
              leading: new Icon(Icons.accessibility),
              title: new Text('这又是一个文案'),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: new RaisedButton(
                    onPressed: () {},
                    color: Colors.orange,
                    child: new Text('苏婷'),
                  ),
                ),
                Expanded(
                  child: new RaisedButton(
                    onPressed: () {},
                    color: Colors.orange,
                    child: new Text('苏婷'),
                  ),
                ),
                Expanded(
                  child: new RaisedButton( //点击路由跳转列表三级页面
                    onPressed: () {
                      // Navigator.pop(context);
                      Navigator.pushNamed(context, 'threeList_route');
                    },
                    color: Colors.orange,
                    child: new Text('模块'),
                  ),
                ),

                // Expanded(
                //   child: new RaisedButton(
                //       onPressed: (){},
                //     color: Colors.orange,
                //     child: new Text('模块'),
                //   ),
                // )
              ],
            ),
            // new Stack(
            //     alignment: const FractionalOffset(0.5, 0.8),
            //     // alignment: Alignment.center,
            //     // fit: StackFit.expand, //未定位widget占满Stack整个空间
            //
            //     children: <Widget>[
            //
            //       CircleAvatar(
            //         backgroundImage: new AssetImage('images/abc.jpg'),
            //         radius: 100.0,
            //       ),
            //       Positioned(
            //         // left: 18.0,
            //         child: new Container(
            //
            //           decoration: new BoxDecoration(
            //             color: Colors.orange,
            //
            //           ),
            //           padding: EdgeInsets.all(5.0),
            //           child: Text('flutter文字描述'),
            //           // child:Transform(
            //           //   transform: Matrix4.skewY(0.3),
            //           //   child: const Text('红红火火恍恍惚惚'),
            //           //
            //           // )
            //         ),
            //       )
            //     ]),
            Padding(
                padding: const EdgeInsets.all(20.0),
                child: Card(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text('你好啊flutter',
                          style: TextStyle(fontWeight: FontWeight.w500),),
                        subtitle: Text('呼和浩特市清水河县'),
                        leading: new Icon(
                          Icons.account_box, color: Colors.blue,),


                      ),
                      new Divider(),
                      ListTile(
                        title: Text('你好啊flutter',
                          style: TextStyle(fontWeight: FontWeight.w500),),
                        subtitle: Text('呼和浩特市清水河县'),
                        leading: new Icon(
                          Icons.account_box, color: Colors.blue,),


                      ),
                      new Divider(),
                      ListTile(
                        title: Text('你好啊flutter',
                          style: TextStyle(fontWeight: FontWeight.w500),),
                        subtitle: Text('呼和浩特市清水河县'),
                        leading: new Icon(
                          Icons.account_box, color: Colors.blue,),


                      ),
                      ListTile(
                        title: Text('你好啊flutter',
                          style: TextStyle(fontWeight: FontWeight.w500),),
                        subtitle: Text('呼和浩特市清水河县',textDirection:TextDirection.rtl,),
                        leading: new Icon(
                          Icons.account_box, color: Colors.blue,),


                      ),
                      ListTile(
                        title: Text('你好啊flutter',
                          style: TextStyle(fontWeight: FontWeight.w500),),
                        subtitle: Text('呼和浩特市清水河县'),
                        leading: new Icon(
                          Icons.account_box, color: Colors.blue,),


                      )
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('new Route'),
      ),
      body: SingleChildScrollView(
        child: container,
      ),
    );
  }

}
//三级页面列表展示
class ThreeListPageRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('三级页面列表展示'),

      ),
      body: ProductList(
          products: List.generate(20, (i) => Product('商品 $i', '描述编号为 $i'))
      ),

    );
  }
}

class ProductList extends StatelessWidget {
  final List<Product> products;

  ProductList({Key key, @required this.products}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget divider1=Divider(color: Colors.blue,);
    Widget divider2=Divider(color: Colors.green);

    return Scaffold(

        body: ListView.separated(

          itemCount: products.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(products[index].title),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>
                        ProductDetail(product: products[index])
                ));
              },
            );
          },
          separatorBuilder: (BuildContext context,int index){
            return index%2==0?divider1:divider2;

          },

        )


    );
  }


}
//商品类
class Product {
  final String title; //商品标题
  final String description; //商品描述
  Product(this.title, this.description);

}
//商品详情页面
class ProductDetail extends StatelessWidget {
  final Product product;

  ProductDetail({Key key, @required this.product}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('${product.title}')),
      body: Center(
        child: RaisedButton(
          child: Text('${product.description}'),
          onPressed: () {
            _navToXiaojiejie(context);
          },

        ),

      ),
    );
  }
  _navToXiaojiejie(BuildContext context)   async {
    final result = await Navigator.push(context,
        MaterialPageRoute(builder: (context)=>ProductDetail())
    );
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('$result'),));

  }
}

