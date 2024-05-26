import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_online_shop/screens/cart/cart_page_backend.dart';
import 'package:flutter_online_shop/screens/home1/home_screen_final.dart';
import 'package:flutter_online_shop/screens/sign_in/sign_in_screen.dart';
import 'package:flutter_online_shop/size_config.dart';
import 'package:provider/provider.dart';
import 'package:flutter_online_shop/screens/base_page/checkout_base_page.dart';
import 'package:flutter_online_shop/provider/cart_provider.dart';

class UnAuthWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, orderModel, child) {
        if (orderModel.isOrderCreated) {
          return Center(
            child: Container(
              margin: EdgeInsets.only(top: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: getProportionateScreenWidth(150.0),
                        height: getProportionateScreenHeight(150.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [
                                Colors.green.withOpacity(1),
                                Colors.green.withOpacity(0.2),
                              ]),
                        ),
                        child: Icon(
                          Icons.lock,
                          color: Colors.white,
                          size: 90,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(15.0)),
                  Opacity(
                    opacity: 0.6,
                    child: Text(
                      "Please sign-in to continue to this section!",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(20.0)),
                  FlatButton(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInScreen()));
                    },
                    padding: EdgeInsets.all(15),
                    color: Colors.green,
                  )
                ],
              ),
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
