import 'package:flutter/material.dart';
import 'package:flutter_online_shop/components/progress_hud.dart';
import 'package:flutter_online_shop/provider/cart_provider.dart';
import 'package:flutter_online_shop/screens/cart/cart_page_backend.dart';
import 'package:flutter_online_shop/size_config.dart';
import 'package:flutter_online_shop/provider/loader_provider.dart';
import 'package:provider/provider.dart';

class BasePage extends StatefulWidget {
  BasePage({Key key}) : super(key: key);

  @override
  BasePageState createState() => BasePageState();
}

class BasePageState<T extends BasePage> extends State<T> {
  bool isApiCallProcess = false;

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Consumer<LoaderProvider>(builder: (context, loaderModel, child) {
      return Scaffold(
        appBar: _buildAppBar(),
        body: ProgressHUD(
          child: pageUI(),
          inAsyncCall: loaderModel.isApiCallProcess,
          opacity: 0.3,
        ),
      );
    });
  }

  Widget pageUI() {
    return null;
  }

  Widget _buildAppBar() {
    return AppBar(
      centerTitle: true,
      brightness: Brightness.dark,
      elevation: 0,
      backgroundColor: Color(0xFF3B54A4),
      automaticallyImplyLeading: true,
      title: Text(
        'UBreak WeFix',
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
            shadows: [
              Shadow(
                color: Colors.black,
                offset: Offset(1, 2),
              ),
            ]),
      ),
      actions: [
        SizedBox(
          width: getProportionateScreenWidth(2),
        ),
        IconButton(
          icon: new Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
          splashRadius: 0.2,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartPage(),
              ),
            );
          },
        ),
        Provider.of<CartProvider>(context, listen: false).cartItems.length == 0
            ? new Container()
            : Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: new Stack(
                  children: [
                    new Icon(
                      Icons.brightness_1,
                      size: 20.0,
                      color: Colors.green[800],
                    ),
                    new Positioned(
                      top: 1.0,
                      right: 6.0,
                      child: Center(
                        child: Text(
                          Provider.of<CartProvider>(context, listen: false)
                              .cartItems
                              .length
                              .toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
      ],
    );
  }
}
