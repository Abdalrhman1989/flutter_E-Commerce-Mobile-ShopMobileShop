import 'package:flutter/material.dart';
import 'package:flutter_online_shop/screens/base_page/checkout_base_page.dart';
import 'package:flutter_online_shop/screens/cart/cart_page_backend.dart';
import 'package:flutter_online_shop/screens/orders/order_detail.dart';
import 'package:flutter_online_shop/screens/profile/my_account.dart';
import '../../size_config.dart';
import 'components/body.dart';
import 'package:flutter_online_shop/screens/orders/orders_page.dart';

class HomeScreenTest extends StatefulWidget {
  static String routeName = "/homeTest";
  int selectedPage;

  HomeScreenTest({Key key, this.selectedPage}) : super(key: key);

  @override
  _HomeScreenTestState createState() => _HomeScreenTestState();
}

class _HomeScreenTestState extends State<HomeScreenTest> {
  List<Widget> _widgetList = [
    Body(),
    CartPage(),
    OrdersPage(),
    MyAccount(),
  ];

  int _index = 0;

  @override
  void initState() {
    super.initState();
    if (this.widget.selectedPage != null) {
      _index = this.widget.selectedPage;
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: _buildAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(
              'Home',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text(
              'Cart',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            title: Text(
              'Orders',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text(
              'Account',
            ),
          ),
        ],
        selectedItemColor: Color(0xFF3B54A4),
        unselectedItemColor: Colors.black12,
        type: BottomNavigationBarType.shifting,
        currentIndex: _index,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
      body: _widgetList[_index],
      //bottomNavigationBar: CustomNavBar(),
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
