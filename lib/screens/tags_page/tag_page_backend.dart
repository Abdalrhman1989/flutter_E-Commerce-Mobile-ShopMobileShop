import 'package:flutter/material.dart';
import 'package:flutter_online_shop/components/product_card_modified.dart';
import 'package:flutter_online_shop/models/product_model.dart';
import 'package:flutter_online_shop/backend/api_service.dart';
import 'package:flutter_online_shop/provider/cart_provider.dart';
import 'package:flutter_online_shop/screens/cart/cart_page_backend.dart';
import 'package:flutter_online_shop/screens/home1/components/section_title.dart';
import 'package:provider/provider.dart';

import '../../size_config.dart';

class TagsPage extends StatefulWidget {
  TagsPage({
    this.labelName,
    this.tagName,
  });

  final String labelName;
  final String tagName;

  @override
  _TagsPageState createState() => _TagsPageState();
}

class _TagsPageState extends State<TagsPage> {
  APIService apiService;

  @override
  void initState() {
    apiService = new APIService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _productsList());
  }

  Widget _productsList() {
    return FutureBuilder(
      future: apiService.getProducts(tagName: this.widget.tagName),
      builder: (BuildContext context, AsyncSnapshot<List<Product>> model) {
        if (model.hasData) {
          return _buildTagsList(model.data);
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget _buildTagsList(List<Product> items) {
    return Column(
      children: [
        Flexible(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: items.map((Product item) {
              return CategoriesCardBackend(
                data: item,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      centerTitle: true,
      brightness: Brightness.dark,
      elevation: 0,
      backgroundColor: Color(0xFF3B54A4),
      automaticallyImplyLeading: true,
      title: Text(
        'UBreak WeFix',
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
            shadows: [
              Shadow(
                color: Colors.black,
                offset: Offset(1, 2),
              ),
            ]),
      ),
      actions: [
        SizedBox(
          width: getProportionateScreenWidth(2),
        ),
        IconButton(
          icon: new Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
          splashRadius: 0.2,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartPage(),
              ),
            );
          },
        ),
        Provider.of<CartProvider>(context, listen: false).cartItems.length == 0
            ? new Container()
            : Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: new Stack(
                  children: [
                    new Icon(
                      Icons.brightness_1,
                      size: 20.0,
                      color: Colors.green[800],
                    ),
                    new Positioned(
                      top: 1.0,
                      right: 6.0,
                      child: Center(
                        child: Text(
                          Provider.of<CartProvider>(context, listen: false)
                              .cartItems
                              .length
                              .toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
      ],
    );
  }
}
