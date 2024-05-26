import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_online_shop/size_config.dart';

class CheckPoints extends StatelessWidget {
  final int checkedTill;
  final List<String> checkPoints;
  final Color checkPointFilledColor;

  CheckPoints({
    this.checkedTill = 1,
    this.checkPointFilledColor,
    this.checkPoints,
  });

  final double circleDia = 32;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (c, s) {
      final double cWidth = ((s.maxWidth - (32.0 * (checkPoints.length + 1))) /
          (checkPoints.length - 1));

      return Container(
        height: getProportionateScreenHeight(56.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: checkPoints.map((e) {
                  int index = checkPoints.indexOf(e);
                  print(index);
                  return Container(
                    height: circleDia,
                    child: Row(
                      children: [
                        Container(
                          width: circleDia,
                          padding: EdgeInsets.all(4),
                          child: Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 18.0,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index <= checkedTill
                                ? checkPointFilledColor
                                : checkPointFilledColor.withOpacity(0.2),
                          ),
                        ),
                        index != (checkPoints.length - 1)
                            ? Container(
                                color: index < checkedTill
                                    ? checkPointFilledColor
                                    : checkPointFilledColor.withOpacity(0.2),
                                height: getProportionateScreenHeight(4.0),
                                width: cWidth,
                              )
                            : Container(),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: checkPoints.map((e) {
                  return Text(
                    e,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      );
    });
  }
}
