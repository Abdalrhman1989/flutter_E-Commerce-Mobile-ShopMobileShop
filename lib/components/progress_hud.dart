import 'package:flutter/material.dart';
import 'package:flutter_online_shop/size_config.dart';

class ProgressHUD extends StatelessWidget {
  final Widget child;
  final bool inAsyncCall;
  final double opacity;
  final Color color;

  ProgressHUD({
    Key key,
    @required this.child,
    @required this.inAsyncCall,
    this.color,
    this.opacity,
    this.valueColor,
  }) : super(key: key);

  final Animation<Color> valueColor;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = new List<Widget>();
    widgetList.add(child);
    if (inAsyncCall) {
      final modal = new Center(
          child: Container(
              width: getProportionateScreenWidth(250.0),
              height: getProportionateScreenHeight(250.0),
              child: Stack(
                children: [
                  new Opacity(
                    opacity: opacity,
                    child: ModalBarrier(
                      dismissible: false,
                      color: color,
                    ),
                  ),
                  new Center(
                    child: new CircularProgressIndicator(),
                  ),
                ],
              )));
      widgetList.add(modal);
    }
    return Stack(
      children: widgetList,
    );
  }
}
