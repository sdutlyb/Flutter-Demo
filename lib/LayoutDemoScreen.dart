import 'package:flutter/material.dart';

import './FavoriteWidget.dart';
import './ActivateWidget.dart';

class LayoutDemoScreen extends StatefulWidget {
  LayoutDemoScreen({Key key, String this.paramsString}) : super(key: key);

  final String paramsString;
  final String title = 'UI 布局Demo界面';
  _LayoutDemoScreenState createState() => _LayoutDemoScreenState();
}

class _LayoutDemoScreenState extends State<LayoutDemoScreen> {
  bool _isActivated = false;

  void _activateWidget(bool oldValue) {
    setState(() {
      _isActivated = !oldValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;

      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Widget titleSection = Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16),
      color: Color.fromRGBO(255, 255, 255, 1),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    '这是如何恶心的dart语法', 
                    style: TextStyle( 
                      fontWeight: FontWeight.bold
                      )
                    ),
                ),
                Text(
                  '我就想看看这里有很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长的文本会怎样',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text(
            '41',
          ),
        ],
      )
    );

    Widget imageSection = Container(
      margin: EdgeInsets.all(16),
      child: Image.asset(
        'images/lake.jpg',
        fit: BoxFit.fitHeight,
      ),
    );


    Widget buttonsSection = Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      color: Color.fromRGBO(255, 255, 255, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Icons.access_time, '时间'),
          buildButtonColumn(Icons.near_me, '导航'),
          buildButtonColumn(Icons.share, '分享')
        ]
      ),
    );

    Widget textSection = Container(
      margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
      padding: EdgeInsets.all(16),
      color: Color.fromRGBO(255, 255, 255, 1),
      child: Text(
        '四列元素中的三个现在已经完成，只剩下图像部分。该图片可以在Creative Commons许可下在线获得， 但是它非常大，且下载缓慢。在步骤0中，您已经将该图像包含在项目中并更新了pubspec文件，所以现在可以从代码中直接引用它。',
        softWrap: true,
        )
    );

    Widget ratingBar = Container(
      margin: EdgeInsets.all(16),
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.amber
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add_box, color: Colors.green[500]),
              Icon(Icons.add_box, color: Colors.green[400]),
              Icon(Icons.add_box, color: Colors.green[300]),
              Icon(Icons.add_box, color: Colors.black),
              Icon(Icons.add_box, color: Colors.black),
            ],
          ),
          Text(
            '170个评价',
            style: TextStyle(
              color: Colors.black38,
              fontWeight: FontWeight.w600,
              fontFamily: 'Roboto',
              letterSpacing: 0.8,
              fontSize: 15.0
            ),
          )
        ],
      )
    );

    List<Container> _buildGridTile(int count) {
      return List<Container>.generate(
        count, (int index) => 
        Container(
          child: Image.network(
            'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560165871244&di=b8d6a8fd9bdbe552afbd9f0be8625f15&imgtype=0&src=http%3A%2F%2Fimg.sccnn.com%2Fbimg%2F338%2F56463.jpg'
          )
        ),
      );
    }
    
    Widget gridViewSection = Container(
      margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
      color: Colors.white,
      height: 360,
      child: GridView.extent(
        maxCrossAxisExtent: 80,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        children: _buildGridTile(70),
      ),
    );

    List<Widget> listTile = List<Widget>.generate(
      120,
      (int index) => ListTile(
        title: Text('你好'),
        subtitle: Text('啦啦啦'),
        leading: Icon(
          Icons.add_circle,
          color: Colors.lightGreen,
        ),
      )
    );

    Widget listViewSection = Container(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      color: Colors.white,
      height: 300,
      child: ListView(
        children: listTile,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            child: Text(widget.paramsString),
          ),
          titleSection,
          buttonsSection,
          imageSection,
          textSection,
          ratingBar,
          gridViewSection,
          listViewSection,
          FavoriteWidget(),
          ActivateWidget(
            isActivate: _isActivated,
            onPressed: _activateWidget,
          ),
        ],
      ),
    );
  }
}