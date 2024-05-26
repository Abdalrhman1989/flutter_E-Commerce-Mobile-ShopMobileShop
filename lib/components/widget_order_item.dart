import 'package:flutter/material.dart';
import 'package:flutter_online_shop/models/order.dart';
import 'package:flutter_online_shop/size_config.dart';
import 'package:flutter_online_shop/screens/orders/order_detail.dart';

class WidgetOrderItem extends StatelessWidget {
  final OrderModel orderModel;

  WidgetOrderItem({this.orderModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          _orderStatus(this.orderModel.status),
          Divider(
            color: Colors.grey,
          ),
          SizedBox(
            height: getProportionateScreenHeight(10.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              iconText(
                Icon(
                  Icons.edit,
                  color: Colors.redAccent,
                ),
                Text(
                  'Order ID',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                this.orderModel.orderNumber.toString(),
                style: TextStyle(fontSize: 14),
              )
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              iconText(
                Icon(
                  Icons.today,
                  color: Colors.redAccent,
                ),
                Text(
                  'Order Date',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                this.orderModel.orderDate.toString(),
                style: TextStyle(fontSize: 14),
              )
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              flatButtonWidget(
                Row(
                  children: [
                    Text("Order Details"),
                    Icon(Icons.chevron_right),
                  ],
                ),
                Colors.green,
                () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderDetailsPage(
                              orderID: this.orderModel.orderId)));
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget iconText(Icon iconWidget, Text textWidget) {
    return Row(
      children: [
        iconWidget,
        SizedBox(width: getProportionateScreenWidth(5.0)),
        textWidget,
      ],
    );
  }

  Widget flatButtonWidget(Widget iconText, Color color, Function onPressed) {
    return FlatButton(
      onPressed: onPressed,
      child: iconText,
      padding: EdgeInsets.all(5),
      color: color,
      shape: StadiumBorder(),
    );
  }

  Widget _orderStatus(String status) {
    Icon icon;
    Color color;
    if (status == "Pending" || status == "Processing" || status == "On-hold") {
      icon = Icon(
        Icons.timer,
        color: Colors.orange,
      );
      color = Colors.orange;
    } else if (status == "Completed") {
      icon = Icon(
        Icons.check,
        color: Colors.green,
      );
      color = Colors.green;
    } else if (status == "Cancelled" ||
        status == "Refunded" ||
        status == "Failed") {
      icon = Icon(
        Icons.clear,
        color: Colors.redAccent,
      );
      color = Colors.redAccent;
    } else {
      icon = Icon(
        Icons.clear,
        color: Colors.redAccent,
      );
      color = Colors.redAccent;
    }
    return iconText(
      icon,
      Text(
        "Order $status",
        style: TextStyle(
          fontSize: 15,
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
