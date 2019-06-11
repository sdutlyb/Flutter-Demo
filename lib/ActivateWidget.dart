import 'package:flutter/material.dart';

class ActivateWidget extends StatelessWidget {
  ActivateWidget({Key key, this.isActivate: false, @required this.onPressed}) : super(key: key);

  final bool isActivate;
  final ValueChanged<bool> onPressed;

  String statustext() {
    return isActivate ? '已激活' : '立即激活';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(16),
        height: 40,
        color: isActivate ? Colors.greenAccent : Colors.redAccent,
        child: FlatButton(
          onPressed: () {
            onPressed(isActivate);
          },
          child: Text(
            statustext(),
            style: TextStyle(fontSize: 20.0, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        )
      );
  }
}