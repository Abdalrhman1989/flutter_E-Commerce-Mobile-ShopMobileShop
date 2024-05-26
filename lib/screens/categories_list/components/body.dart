import 'package:flutter/material.dart';
import 'package:flutter_online_shop/components/progress_hud.dart';

class Body extends StatefulWidget {
  @override
  BodyState createState() => BodyState();
}

class BodyState<T extends Body> extends State<T> {
  bool isApiCallProcess = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProgressHUD(
        child: pageUI(),
        inAsyncCall: isApiCallProcess,
        opacity: 0.3,
      ),
    );
  }

  Widget pageUI() {
    return null;
  }
}
