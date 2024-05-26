import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_online_shop/provider/cart_provider.dart';
import 'package:flutter_online_shop/provider/loader_provider.dart';
import 'package:flutter_online_shop/provider/order_provider.dart';
import 'package:flutter_online_shop/provider/tags_provider.dart';
import 'package:flutter_online_shop/routes.dart';
import 'package:flutter_online_shop/screens/base_page/base_page.dart';
import 'package:flutter_online_shop/screens/cart/cart_page_backend.dart';
import 'package:flutter_online_shop/screens/categories_list/product_page.dart';
import 'package:flutter_online_shop/screens/details_backend/products_details_page.dart';
import 'package:flutter_online_shop/screens/orders/orders_page.dart';
import 'package:flutter_online_shop/screens/tags_page/tag_page_test.dart';
import 'package:provider/provider.dart';
import 'package:flutter_online_shop/provider/product_provider.dart';
import 'package:flutter_online_shop/helper/theme_main.dart';
import 'package:flutter_online_shop/screens/splash_screen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MainTheme mainTheme;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          //added this
          create: (context) => TagsProvider(),
          child: TagsPageTest(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
          child: ProductPage(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoaderProvider(),
          child: BasePage(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
          child: ProductDetails(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
          child: CartPage(),
        ),
        ChangeNotifierProvider(
          create: (context) => OrderProvider(),
          child: OrdersPage(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Muli',
          primaryColor: Colors.white,
          brightness: Brightness.light,
          accentColor: Colors.redAccent,
          dividerColor: Colors.redAccent,
          focusColor: Colors.redAccent,
          //hintColor: Colors.redAccent,
          textTheme: TextTheme(
            headline4: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              color: Colors.redAccent,
              height: 1.3,
            ),
            headline2: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w700,
              color: Colors.redAccent,
              height: 1.4,
            ),
            headline3: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              height: 1.3,
            ),
            subtitle2: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              height: 1.3,
            ),
            caption: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w300,
              color: Colors.grey,
              height: 1.2,
            ),
          ),
        ),
        //home: SplashScreen(),
        initialRoute: SplashScreen.routeName,
        routes: routes,
        // <String, WidgetBuilder>{
        //   '/paypal': (BuildContext context) => new PaypalPaymentScreen()
        // },
      ),
    );
  }
}
