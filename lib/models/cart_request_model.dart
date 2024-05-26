import 'package:flutter/material.dart';

class CartRequestModel {
  int userId;
  List<CartProducts> products;

  CartRequestModel({
    this.products,
    this.userId,
  });

  CartRequestModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    if (json['products'] != null) {
      products = new List<CartProducts>();
      json['products'].forEach((v) {
        products.add(new CartProducts.fromJson(v));
        print(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartProducts {
  int productId;
  int quantity;

  CartProducts({this.quantity, this.productId});

  CartProducts.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['quantity'] = this.quantity;
    return data;
  }
}
