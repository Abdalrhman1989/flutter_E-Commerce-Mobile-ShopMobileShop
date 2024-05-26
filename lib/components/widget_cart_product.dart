import 'package:flutter/material.dart';
import 'package:flutter_online_shop/models/cart_response_model.dart';
import 'package:flutter_online_shop/provider/cart_provider.dart';
import 'package:flutter_online_shop/provider/loader_provider.dart';
import 'package:flutter_online_shop/size_config.dart';
import 'package:provider/provider.dart';
import 'package:flutter_online_shop/utils/utils.dart';

import 'custom_stepper.dart';

class CartProduct extends StatelessWidget {
  CartProduct({this.data});

  CartItem data;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: makeListTitle(context),
      ),
    );
  }

  ListTile makeListTitle(BuildContext context) => ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        leading: Container(
          width: getProportionateScreenWidth(50.0),
          height: getProportionateScreenHeight(150.0),
          alignment: Alignment.center,
          child: Image.network(
            data.thumbNail,
            height: getProportionateScreenHeight(150.0),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(
            data.productName,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        subtitle: Padding(
          padding: EdgeInsets.all(5.0),
          child: Wrap(
            direction: Axis.vertical,
            children: [
              Text(
                data.calculateDiscount() > 0
                    ? "€${data.productSalePrice.toString()}"
                    : "€${data.productRegularPrice.toString()}",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              FlatButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 20.0,
                    ),
                    Text(
                      "Remove",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  Utils.showMessage(
                      context,
                      "Removing item!",
                      "Do you want to remove this item?",
                      "Yes",
                      () {
                        Provider.of<LoaderProvider>(context, listen: false)
                            .setLoadingStatus(true);
                        var cartProvider =
                            Provider.of<CartProvider>(context, listen: false)
                                .removeItem(data.productId);
                        Provider.of<LoaderProvider>(context, listen: false)
                            .setLoadingStatus(false);

                        Navigator.of(context).pop();
                      },
                      buttonText2: "No",
                      isConfirmationDialog: true,
                      onPressed2: () {
                        Navigator.of(context).pop();
                      });
                },
                padding: EdgeInsets.all(8.0),
                color: Colors.redAccent,
                shape: StadiumBorder(),
              ),
            ],
          ),
        ),
        trailing: Container(
          width: getProportionateScreenWidth(120.0),
          child: CustomStepper(
              lowerLimit: 1,
              value: data.qty,
              iconSize: 22.0,
              stepValue: 1,
              upperLimit: 20,
              onChanged: (value) {
                Provider.of<CartProvider>(context, listen: false)
                    .updateQty(data.productId, value);
              }),
        ),
      );
}
