import 'package:flutter/material.dart';
import 'package:flutter_online_shop/screens/cart/cart_page_backend.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({
    Key key,
  }) : super(key: key);

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return buildNavBar();
  }

  Widget buildNavBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(Icons.home),
            onPressed: null,
          ),
          title: Text(
            'Store',
            style: TextStyle(),
          ),
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(Icons.shopping_bag),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartPage(),
              ),
            ),
          ),
          title: Text(
            'My Cart',
            style: TextStyle(),
          ),
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(Icons.favorite),
            onPressed: null,
            focusColor: Color(0xFF3B54A4),
            color: Color(0xFF3B54A4),
            disabledColor: Colors.black38,
          ),
          title: Text(
            'Favorites',
            style: TextStyle(),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.account_circle,
          ),
          title: Text(
            'My Account',
            style: TextStyle(),
          ),
        )
      ],
      selectedItemColor: Color(0xFF3B54A4),
      unselectedItemColor: Colors.black38,
      type: BottomNavigationBarType.shifting,
      currentIndex: _index,
      onTap: (index) {
        setState(() {
          _index = index;
        });
      },
    );
  }
}
