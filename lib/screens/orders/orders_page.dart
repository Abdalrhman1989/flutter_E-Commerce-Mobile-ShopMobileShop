import 'package:flutter/material.dart';
import 'package:flutter_online_shop/models/order.dart';
import 'package:flutter_online_shop/components/widget_order_item.dart';
import 'package:flutter_online_shop/provider/order_provider.dart';
import 'package:flutter_online_shop/screens/base_page/base_page.dart';
import 'package:provider/provider.dart';

class OrdersPage extends BasePage {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends BasePageState<OrdersPage> {
  @override
  void initState() {
    super.initState();
    var orderProvider = Provider.of<OrderProvider>(context, listen: false);
    orderProvider.fetchOrders();
  }

  @override
  Widget pageUI() {
    //return _listViewWidget(context, orders);
    return new Consumer<OrderProvider>(builder: (context, ordersModel, child) {
      if (ordersModel.allOrders != null && ordersModel.allOrders.length > 0) {
        return _listViewWidget(context, ordersModel.allOrders);
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }

  Widget _listViewWidget(BuildContext context, List<OrderModel> orders) {
    return ListView(
      children: [
        ListView.builder(
          itemCount: orders.length,
          physics: ScrollPhysics(),
          padding: EdgeInsets.all(8),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(16.0),
              ),
              child: WidgetOrderItem(
                orderModel: orders[index],
              ),
            );
          },
        )
      ],
    );
  }
}
