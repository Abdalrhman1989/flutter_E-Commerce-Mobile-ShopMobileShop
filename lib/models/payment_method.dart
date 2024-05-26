import 'package:flutter/cupertino.dart';
import 'package:flutter_online_shop/components/widget_order_success.dart';
import 'package:flutter_online_shop/provider/razor_payment_service.dart';
import 'package:flutter_online_shop/screens/orders/order_detail.dart';
import 'package:flutter_online_shop/screens/payment/paypal_payment.dart';

class PaymentMethod {
  String id;
  String name;
  String description;
  String logo;
  String route;
  Function onTap;
  bool isRouteRedirect;

  PaymentMethod(
    this.id,
    this.name,
    this.description,
    this.logo,
    this.route,
    this.onTap,
    this.isRouteRedirect,
  );
}

class PaymentMethodList {
  List<PaymentMethod> _paymentList;
  List<PaymentMethod> _cashList;

  PaymentMethodList(BuildContext context) {
    this._paymentList = [
      new PaymentMethod(
        "viabill",
        "ViaBill",
        "Click to pay with ViaBill",
        "assets/images/razorpay.png",
        "/ViaBill",
        () {
          RazorPaymentService razorPaymentService = new RazorPaymentService();
          razorPaymentService.initPaymentGateWay(context);
          razorPaymentService.getPayment(context);
        },
        false,
      ),
      new PaymentMethod(
        "paypal",
        "PayPal Payment",
        "Click to pay with your PayPal account",
        "assets/images/paypal.png",
        "PaypalPaymentScreen.routeName",
        () {},
        true,
      ),
    ];
    this._cashList = [
      new PaymentMethod(
        "cod",
        "Cash on Delivery",
        "Click to pay cash on delivery",
        "assets/images/cash.png",
        OrderSuccessWidget.routeName,
        () {},
        false,
      ),
    ];
  }

  List<PaymentMethod> get paymentList => _paymentList;

  List<PaymentMethod> get cashList => _cashList;
}
