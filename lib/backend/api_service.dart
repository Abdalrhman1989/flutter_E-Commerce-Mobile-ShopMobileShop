import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_online_shop/backend/config.dart';
import 'package:flutter_online_shop/backend/shared_service.dart';
import 'package:flutter_online_shop/models/customer_model.dart';
import 'package:flutter_online_shop/models/customer_detail_model.dart';
import 'package:flutter_online_shop/models/login_model.dart';
import 'package:flutter_online_shop/models/category_model.dart';
import 'package:flutter_online_shop/models/order.dart';
import 'package:flutter_online_shop/models/order_detail_model.dart';
import 'package:flutter_online_shop/models/product_model.dart';
import 'package:flutter_online_shop/models/cart_request_model.dart';
import 'package:flutter_online_shop/models/cart_response_model.dart';

class APIService {
  Future<bool> createCustomer(CustomerModel customerModel) async {
    var authToken = base64.encode(
      utf8.encode(Config.key + ":" + Config.secretKey),
    );
    bool ret = false;
    try {
      var response = await Dio().post(Config.url + Config.customerUrl,
          data: customerModel.toJson(),
          options: new Options(headers: {
            HttpHeaders.authorizationHeader: 'Basic $authToken',
            HttpHeaders.contentTypeHeader: "application/json"
          }));
      if (response.statusCode == 201) {
        ret = true;
      }
    } on DioError catch (error) {
      if (error.response.statusCode == 404) {
        ret = false;
      } else {
        ret = false;
      }
    }
    return ret;
  }

  Future<LoginResponseModel> loginCustomer(
      String username, String password) async {
    LoginResponseModel model;
    try {
      var response = await Dio().post(
        Config.tokenURL,
        data: {
          "username": username,
          "password": password,
        },
        options: new Options(headers: {
          HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded",
        }),
      );
      if (response.statusCode == 200) {
        model = LoginResponseModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e.message);
    }
    return model;
  }

  Future<List<Category>> getCategories() async {
    List<Category> data = new List<Category>();
    try {
      String url = Config.url +
          Config.categoriesURL +
          "?consumer_key=${Config.key}&consumer_secret=${Config.secretKey}";
      var response = await Dio().get(url,
          options: new Options(
            headers: {
              HttpHeaders.contentTypeHeader: "application/json",
            },
          ));
      if (response.statusCode == 200) {
        data = (response.data as List)
            .map(
              (i) => Category.fromJson(i),
            )
            .toList();
      }
    } on DioError catch (e) {
      print(e.response);
    }
    return data;
  }

  Future<List<Product>> getProducts({
    int pageNumber,
    int pageSize,
    String strSearch,
    String tagName,
    String categoryId,
    List<int> productIds,
    String sortBy,
    String sortOrder = "asc",
  }) async {
    List<Product> data = new List<Product>();

    try {
      String parameter = "";
      if (strSearch != null) {
        parameter += "&search=$strSearch";
      }
      if (pageSize != null) {
        parameter += "&per_page=$pageSize";
      }
      if (pageNumber != null) {
        parameter += "&page=$pageNumber";
      }
      if (tagName != null) {
        parameter += "&tag=$tagName";
      }
      if (categoryId != null) {
        parameter += "&category=$categoryId";
      }
      if (sortBy != null) {
        parameter += "&orderby=$sortBy";
      }
      if (sortOrder != null) {
        parameter += "&order=$sortOrder";
      }
      if (productIds != null) {
        parameter += "&include=${productIds.join(",").toString()}";
      }
      String url = Config.url +
          Config.productsURL +
          "?consumer_key=${Config.key}&consumer_secret=${Config.secretKey}${parameter.toString()}";
      var response = await Dio().get(
        url,
        options: new Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      );
      if (response.statusCode == 200) {
        data = (response.data as List)
            .map(
              (i) => Product.fromJson(i),
            )
            .toList();
      }
    } on DioError catch (e) {
      print(e.response);
    }
    return data;
  }

  Future<CartResponseModel> addToCart(CartRequestModel model) async {
    LoginResponseModel loginResponseModel = await SharedService.loginDetails();

    CartResponseModel responseModel;

    if (loginResponseModel.data != null) {
      model.userId = loginResponseModel.data.id;
    }
    try {
      var response = await Dio().post(
        Config.url + Config.addToCartURL,
        data: model.toJson(),
        options: new Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
      );

      if (response.statusCode == 200) {
        responseModel = CartResponseModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        print(e.response.statusCode);
      } else {
        print(e.message);
        print(e.request);
      }
    }
    return responseModel;
  }

  Future<CartResponseModel> getCartItems() async {
    CartResponseModel responseModel;
    try {
      LoginResponseModel loginResponseModel =
          await SharedService.loginDetails();
      if (loginResponseModel.data != null) {
        int userId = loginResponseModel.data.id;

        String url = Config.url +
            Config.cartURL +
            "?user_id=$userId&consumer_key=${Config.key}&consumer_secret=${Config.secretKey}";
        print(url);
        var response = await Dio().get(
          url,
          options: new Options(
            headers: {
              HttpHeaders.contentTypeHeader: "application/json",
            },
          ),
        );
        if (response.statusCode == 200) {
          responseModel = CartResponseModel.fromJson(response.data);
        }
      }
    } on DioError catch (e) {
      print(e.response);
    }
    return responseModel;
  }

  Future<CustomerDetailsModel> customerDetails() async {
    CustomerDetailsModel responseModel;

    try {
      LoginResponseModel loginResponseModel =
          await SharedService.loginDetails();
      if (loginResponseModel.data != null) {
        int userId = loginResponseModel.data.id;
        String url = Config.url +
            Config.customerUrl +
            "/$userId?consumer_key=${Config.key}&consumer_secret=${Config.secretKey}";
        var response = await Dio().get(
          url,
          options: new Options(
            headers: {
              HttpHeaders.contentTypeHeader: "application/json",
            },
          ),
        );
        if (response.statusCode == 200) {
          responseModel = CustomerDetailsModel.fromJson(response.data);
          print(responseModel);
        }
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        print(e.response.statusCode);
      } else {
        print(e.message);
        print(e.request);
      }
    }
    return responseModel;
  }

  Future<bool> createOrder(OrderModel model) async {
    model.customerId = Config.userID;
    bool isOrderCreated = false;
    var authToken = base64.encode(
      utf8.encode(Config.key + ":" + Config.secretKey),
    );
    try {
      var response = await Dio().post(Config.url + Config.orderURL,
          data: model.toJson(),
          options: new Options(headers: {
            HttpHeaders.authorizationHeader: 'Basic $authToken',
            HttpHeaders.contentTypeHeader: "application/json",
          }));
      if (response.statusCode == 201) {
        isOrderCreated = true;
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        print(e.response.statusCode);
      } else {
        print(e.message);
        print(e.request);
      }
    }
    return isOrderCreated;
  }

  Future<List<OrderModel>> getOrders() async {
    List<OrderModel> data = new List<OrderModel>();

    try {
      String url = Config.url +
          Config.orderURL +
          "?consumer_key${Config.key}&consumer_secret=${Config.secretKey}";

      print(url);

      var response = await Dio().get(
        url,
        options: new Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
      );

      if (response.statusCode == 200) {
        data = (response.data as List)
            .map(
              (i) => OrderModel.fromJson(i),
            )
            .toList();
      }
    } on DioError catch (e) {
      print(e.response);
    }
    return data;
  }

  Future<OrderDetailModel> getOrderDetails(
    int orderId,
  ) async {
    OrderDetailModel responseModel = new OrderDetailModel();
    try {
      String url = Config.url +
          Config.orderURL +
          "/$orderId?consumer_key=${Config.key}&consumer_secre=${Config.secretKey}";
      print(url);
      var response = await Dio().get(
        url,
        options: new Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
      );
      if (response.statusCode == 200) {
        responseModel = OrderDetailModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e.response);
    }
    return responseModel;
  }
}
