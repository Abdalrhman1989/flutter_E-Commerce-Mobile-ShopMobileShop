import 'package:flutter/material.dart';
import 'package:flutter_online_shop/components/widget_order_success.dart';
import 'package:flutter_online_shop/components/widget_payment_method_listitem.dart';
import 'package:flutter_online_shop/models/payment_method.dart';
import 'package:flutter_online_shop/screens/base_page/base_page.dart';
import 'package:flutter_online_shop/screens/orders/order_detail.dart';
import 'package:flutter_online_shop/size_config.dart';
import 'package:flutter_online_shop/screens/base_page/checkout_base_page.dart';

class PaymentMethodsWidget extends CheckoutBasePage {
  @override
  _PaymentMethodsWidgetState createState() => _PaymentMethodsWidgetState();
}

class _PaymentMethodsWidgetState
    extends CheckoutBasePageState<PaymentMethodsWidget> {
  PaymentMethodList paymentMethodList;

  @override
  void initState() {
    super.initState();
    this.currentPage = 1;
  }

  @override
  Widget pageUI() {
    paymentMethodList = new PaymentMethodList(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: getProportionateScreenHeight(15.0),
          ),
          paymentMethodList.paymentList.length > 0
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 0.0),
                    leading: Icon(
                      Icons.payment,
                      color: Theme.of(context).hintColor,
                    ),
                    title: Text(
                      'Payment Options',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    subtitle: Text("Select your preferred Payment Mode"),
                  ),
                )
              : SizedBox(height: 0),
          SizedBox(height: getProportionateScreenHeight(10.0)),
          ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            primary: false,
            itemBuilder: (context, index) {
              return PaymentMethodListItem(
                paymentMethod: paymentMethodList.paymentList.elementAt(index),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: getProportionateScreenHeight(10.0));
            },
            itemCount: paymentMethodList.paymentList.length,
          ),
          SizedBox(
            height: getProportionateScreenHeight(15.0),
          ),
          paymentMethodList.cashList.length > 0
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 0.0),
                    leading: Icon(
                      Icons.monetization_on,
                      color: Theme.of(context).hintColor,
                    ),
                    title: Text(
                      'Cash on Delivery',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    subtitle: Text("Select your preferred Payment Mode"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrderSuccessWidget()));
                    },
                  ),
                )
              : SizedBox(height: 0),
          SizedBox(height: getProportionateScreenHeight(10.0)),
          ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            primary: false,
            itemBuilder: (context, index) {
              return PaymentMethodListItem(
                paymentMethod: paymentMethodList.cashList.elementAt(index),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: getProportionateScreenHeight(10.0));
            },
            itemCount: paymentMethodList.cashList.length,
          ),
        ],
      ),
    );
  }
}
