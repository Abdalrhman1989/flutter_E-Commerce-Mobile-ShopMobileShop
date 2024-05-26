import 'package:flutter/material.dart';
import 'package:flutter_online_shop/components/product_details_widget.dart';
import 'package:flutter_online_shop/models/product_model.dart';
import 'package:flutter_online_shop/screens/base_page/base_page.dart';

class ProductDetails extends BasePage {
  ProductDetails({Key key, this.product}) : super(key: key);
  Product product;

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends BasePageState<ProductDetails> {
  @override
  Widget pageUI() {
    return ProductDetailsWidget(data: this.widget.product);
  }
}
