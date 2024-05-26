import 'package:flutter/material.dart';
import 'package:flutter_online_shop/components/custom_bottom_nav_bar.dart';
import 'package:flutter_online_shop/components/widget_payment_method_listitem.dart';
import 'package:flutter_online_shop/models/payment_method.dart';
import 'package:flutter_online_shop/provider/cart_provider.dart';
import 'package:flutter_online_shop/screens/cart/cart_page_backend.dart';
import 'package:flutter_online_shop/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_online_shop/utils/cart_icons.dart';
import 'package:provider/provider.dart';
import 'package:flutter_online_shop/components/custom_bottom_nav_bar2.dart';
import '../../size_config.dart';

class HomePageModified extends StatefulWidget {
  static String routeName = "/homeModified";

  @override
  _HomePageModifiedState createState() => _HomePageModifiedState();
}

class _HomePageModifiedState extends State<HomePageModified> {
  List<Widget> _widgetList = [
    DashboardPage(),
    CartPage(),
    DashboardPage(),
    PaymentMethodListItem(
      paymentMethod: new PaymentMethod(
        "razorpay",
        "RazorPay",
        "Click to pay with RazorPay",
        "assets/images/razorpay.png",
        "/RazorPay",
        () {},
        false,
      ),
    ),
  ];
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: _buildAppBar(),
      bottomNavigationBar: CustomNavBar(),
      body: _widgetList[_index],
    );
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
          fontSize: 20.0,
        ),
      ),
      actions: [
        Icon(
          Icons.notifications_none,
          color: Colors.white,
        ),
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
        Icon(
          Icons.shopping_cart,
          color: Colors.white,
        ),
        Provider.of<CartProvider>(context, listen: false).cartItems.length == 0
            ? new Container()
            : new Positioned(
                child: new Stack(
                  children: [
                    new Icon(
                      Icons.brightness_1,
                      size: 20.0,
                      color: Colors.green[800],
                    ),
                    new Positioned(
                      top: 4.0,
                      right: 4.0,
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
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}
