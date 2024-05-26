import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_online_shop/backend/shared_service.dart';
import 'package:flutter_online_shop/components/progress_hud.dart';
import 'package:flutter_online_shop/components/verify_address.dart';
import 'package:flutter_online_shop/components/widget_cart_product.dart';
import 'package:flutter_online_shop/provider/cart_provider.dart';
import 'package:flutter_online_shop/provider/loader_provider.dart';
import 'package:flutter_online_shop/size_config.dart';
import 'package:provider/provider.dart';
import 'package:flutter_online_shop/components/unauth_widget.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    var cartItemsList = Provider.of<CartProvider>(context, listen: false);
    cartItemsList.resetStreams();
    cartItemsList.fetchCartItems();
  }

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
      future: SharedService.isLoggedIn(),
      builder: (BuildContext context, AsyncSnapshot<bool> loginModel) {
        if (loginModel.hasData) {
          if (loginModel.data) {
            return Consumer<LoaderProvider>(
                builder: (context, loaderModel, child) {
              return Scaffold(
                body: ProgressHUD(
                  child: _cartItemsList(),
                  inAsyncCall: loaderModel.isApiCallProcess,
                  opacity: 0.3,
                ),
              );
            });
          } else {
            return UnAuthWidget();
          }
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget _cartItemsList() {
    return new Consumer<CartProvider>(builder: (context, cartModel, child) {
      if (cartModel.cartItems != null && cartModel.cartItems.length > 0) {
        return SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: cartModel.cartItems.length,
                    itemBuilder: (context, index) {
                      return CartProduct(
                        data: cartModel.cartItems[index],
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Icon(
                              Icons.sync,
                              color: Colors.white,
                            ),
                            Text(
                              'Update Cart',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        onPressed: () {
                          Provider.of<LoaderProvider>(context, listen: false)
                              .setLoadingStatus(true);
                          var cartProvider =
                              Provider.of<CartProvider>(context, listen: false);
                          cartProvider.updateCart((val) {
                            Provider.of<LoaderProvider>(context, listen: false)
                                .setLoadingStatus(false);
                          });
                        },
                        padding: EdgeInsets.all(15.0),
                        color: Colors.green,
                        shape: StadiumBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: getProportionateScreenHeight(100.0),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          new Text(
                            "Total",
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          new Text(
                            "€${cartModel.totalAmount.toStringAsFixed(2)}",
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      FlatButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Checkout',
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VerifyAddress()),
                          );
                        },
                        padding: EdgeInsets.all(5.0),
                        color: Color(0xFF3B54A4),
                        shape: StadiumBorder(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      } else {
        return Container(
          width: 0.0,
          height: 0.0,
          child: Center(
            child: Text(
              "Your cart is empty",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.black,
              ),
            ),
          ),
        );
      }
    });
  }

/* Widget _cartItemsList() {
    return new Consumer<CartProvider>(builder: (context, cartModel, child) {
      if (cartModel.cartItems != null && cartModel.cartItems.length > 0) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: cartModel.cartItems.length,
                  itemBuilder: (context, index) {
                    return CartProduct(
                      data: cartModel.cartItems[index],
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Icon(
                            Icons.sync,
                            color: Colors.white,
                          ),
                          Text(
                            'Update Cart',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      onPressed: () {
                        Provider.of<LoaderProvider>(context, listen: false)
                            .setLoadingStatus(true);
                        var cartProvider =
                        Provider.of<CartProvider>(context, listen: false);
                        cartProvider.updateCart((val) {
                          Provider.of<LoaderProvider>(context, listen: false)
                              .setLoadingStatus(false);
                        });
                      },
                      padding: EdgeInsets.all(15.0),
                      color: Colors.green,
                      shape: StadiumBorder(),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: getProportionateScreenHeight(100.0),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        new Text(
                          "Total",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        new Text(
                          "€${cartModel.totalAmount.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    FlatButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Checkout',
                            style: TextStyle(color: Colors.white),
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VerifyAddress()),
                        );
                      },
                      padding: EdgeInsets.all(5.0),
                      color: Color(0xFF3B54A4),
                      shape: StadiumBorder(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      } else {
        return Container(
          width: 0.0,
          height: 0.0,
          child: Center(
            child: Text(
              "Your cart is empty",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.black,
              ),
            ),
          ),
        );
      }
    });
  }*/
}
