import 'package:flutter/material.dart';
import 'package:flutter_online_shop/components/custom_bottom_nav_bar.dart';
import 'package:flutter_online_shop/components/custom_bottom_nav_bar2.dart';
import 'package:flutter_online_shop/provider/cart_provider.dart';
import 'package:provider/provider.dart';
import '../../enums.dart';
import '../../size_config.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
      //bottomNavigationBar: CustomNavBar(),
      appBar: _buildAppBar(),
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
            fontSize: 30.0,
            shadows: [
              Shadow(
                color: Colors.black,
                offset: Offset(1, 2),
              ),
            ]),
      ),
    );
  }
}
