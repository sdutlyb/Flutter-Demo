import 'package:flutter/material.dart';

class FavoriteWidget extends StatefulWidget {
  FavoriteWidget({Key key, int currentCount}) : super(key: key);

  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _favoritePressed() {
    if (_isFavorited) {
      setState(() {
        _isFavorited = false;
        _favoriteCount--;
      });
    } else {
      setState(() {
        _isFavorited = true;
        _favoriteCount++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, top: 16),
      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
      color: Colors.white,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            icon: _isFavorited
            ? Icon(Icons.favorite, color: Colors.red[400],)
            : Icon(Icons.favorite, color: Colors.grey[400],),
            onPressed: _favoritePressed,
          ),
          Expanded(
            child: Text('$_favoriteCount'),
          ),
          FlatButton(
            onPressed: () {
              AlertDialog(
                title: Text('温馨提示')
              );
            },
            child: Text('详情'),
          )
        ],
      ),
    );
    
  }
}