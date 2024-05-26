import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

class ExpandText extends StatefulWidget {
  ExpandText({
    this.labelHeader,
    this.desc,
    this.shortDesc,
  });

  String labelHeader;
  String desc;
  String shortDesc;

  @override
  _ExpandTextState createState() => _ExpandTextState();
}

class _ExpandTextState extends State<ExpandText> {
  bool descTextShowFlag = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            this.widget.labelHeader,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Html(
            data: descTextShowFlag ? this.widget.desc : this.widget.shortDesc,
            style: {
              "div": Style(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                fontSize: FontSize.medium,
              ),
            },
          ),
          Align(
            child: GestureDetector(
              child: Text(
                descTextShowFlag ? "Show Less" : "Show More",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              onTap: () {
                setState(() {
                  descTextShowFlag = !descTextShowFlag;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
