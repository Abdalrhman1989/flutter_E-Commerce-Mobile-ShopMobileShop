import 'package:flutter/material.dart';
import 'package:flutter_online_shop/components/widget_payment_method_listitem.dart';
import 'package:flutter_online_shop/models/payment_method.dart';
import 'package:flutter_online_shop/screens/cart/cart_page_backend.dart';
import 'package:flutter_online_shop/screens/cart/cart_screen.dart';
import 'package:flutter_online_shop/screens/home1/home_screen.dart';
import 'package:flutter_online_shop/screens/profile/profile_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';
import '../enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key key,
    @required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: MenuState.home == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () => Navigator.push(
                    context, MaterialPageRoute(builder: (_) => HomeScreen())),
              ),
              IconButton(
                icon: Icon(
                  Icons.shopping_bag,
                  color: MenuState.cart == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartPage(), //CartScreen
                    ),
                  );
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: MenuState.favorite == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentMethodListItem(
                        paymentMethod: new PaymentMethod(
                          "razorpay",
                          "RazorPay",
                          "Click to pay with RazorPay",
                          "assets/images/razorpay.png",
                          "/RazorPay",
                          () {},
                          false,
                        ),
                      ), //CartScreen
                    ),
                  );
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.account_circle,
                  color: MenuState.profile == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => ProfileScreen())),
              ),
            ],
          )),
    );
  }
}
