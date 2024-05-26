import 'package:flutter/material.dart';

class CartResponseModel {
  bool status;
  List<CartItem> data;

  CartResponseModel({
    this.data,
    this.status,
  });

  CartResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = new List<CartItem>();
      json['data'].forEach((v) {
        data.add(new CartItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['products'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartItem {
  int productId;
  String productName;
  String productRegularPrice;
  String productSalePrice;
  String thumbNail;
  int qty;
  double lineSubtotal;
  double lineTotal;
  int variationId;

  CartItem({
    this.productId,
    this.lineSubtotal,
    this.lineTotal,
    this.productName,
    this.productRegularPrice,
    this.productSalePrice,
    this.qty,
    this.thumbNail,
    this.variationId,
  });

  CartItem.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productRegularPrice = json['product_regular_price'];
    productSalePrice = json['product_sale_price'];
    thumbNail = json['thumbnail'];
    qty = json['qty'];
    lineTotal = double.parse(json['line_total'].toString());
    lineSubtotal = double.parse(json['line_subtotal'].toString());
    variationId = json['variation_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['product_regular_price'] = this.productRegularPrice;
    data['product_sale_price'] = this.productSalePrice;
    data['thumbnail'] = this.thumbNail;
    data['qty'] = this.qty;
    data['line_total'] = this.lineTotal;
    data['line_subtotal'] = this.lineSubtotal;
    data['variation_id'] = this.variationId;
    return data;
  }

  calculateDiscount() {
    double regularPrice = double.parse(this.productRegularPrice);
    double salePrice = this.productSalePrice != ""
        ? double.parse(this.productSalePrice)
        : regularPrice;
    double discount = regularPrice - salePrice;
    double disPercent = (discount / regularPrice) * 100;
    return disPercent.round();
  }
}
