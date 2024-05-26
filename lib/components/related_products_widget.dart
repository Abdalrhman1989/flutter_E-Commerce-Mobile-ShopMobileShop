import 'package:flutter/material.dart';
import 'package:flutter_online_shop/backend/api_service.dart';
import 'package:flutter_online_shop/models/product_model.dart';
import 'package:flutter_online_shop/screens/home1/components/section_title.dart';

import '../size_config.dart';

class RelatedProductsWidget extends StatefulWidget {
  RelatedProductsWidget({
    this.labelName,
    this.products,
  });

  final String labelName;
  final List<int> products;

  @override
  _RelatedProductsWidgetState createState() => _RelatedProductsWidgetState();
}

class _RelatedProductsWidgetState extends State<RelatedProductsWidget> {
  APIService apiService;

  @override
  void initState() {
    apiService = new APIService();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SectionTitle(title: this.widget.labelName, press: () {}),
      ),
      SizedBox(height: getProportionateScreenWidth(2)),
      _productsList(),
    ]);
  }

  Widget _productsList() {
    return FutureBuilder(
      future: apiService.getProducts(productIds: this.widget.products),
      builder: (BuildContext context, AsyncSnapshot<List<Product>> model) {
        if (model.hasData) {
          return _buildList(model.data);
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget _buildList(List<Product> items) {
    return Container(
      height: getProportionateScreenHeight(200.0),
      alignment: Alignment.centerLeft,
      child: ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          var data = items[index];
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.all(10.0),
                  width: getProportionateScreenWidth(130.0),
                  height: getProportionateScreenHeight(120.0),
                  alignment: Alignment.center,
                  child: Image.network(
                    data.images.length > 0
                        ? data.images[0].src
                        : "https://www.freeiconspng.com/uploads/no-image-icon-21.png",
                    height: getProportionateScreenHeight(120.0),
                    fit: BoxFit.cover,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(4.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 5),
                        blurRadius: 15.0,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: getProportionateScreenWidth(130.0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    data.name,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
