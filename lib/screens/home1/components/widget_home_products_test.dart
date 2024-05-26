import 'package:flutter/material.dart';
import 'package:flutter_online_shop/backend/config.dart';
import 'package:flutter_online_shop/models/product_model.dart';
import 'package:flutter_online_shop/backend/api_service.dart';
import 'package:flutter_online_shop/screens/home1/components/section_title.dart';
import 'package:flutter_online_shop/screens/tags_page/tag_page_backend.dart';
import 'package:flutter_online_shop/screens/tags_page/tag_page_test.dart';
import '../../../size_config.dart';

class WidgetHomeProducts extends StatefulWidget {
  WidgetHomeProducts({
    this.labelName,
    this.tagName,
    this.press,
  });

  final String labelName;
  final String tagName;
  final Function press;

  @override
  _WidgetHomeProductsState createState() => _WidgetHomeProductsState();
}

class _WidgetHomeProductsState extends State<WidgetHomeProducts> {
  APIService apiService;

  @override
  void initState() {
    apiService = new APIService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SectionTitle(
            title: this.widget.labelName,
            press: () {
              this.widget.press();
            }),
      ),
      SizedBox(height: getProportionateScreenWidth(2)),
      _productsList(),
    ]);
  }

  Widget _productsList() {
    return FutureBuilder(
      future: apiService.getProducts(tagName: this.widget.tagName),
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
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TagsPageTest(
                    tagName: data.id.toString(),
                  ),
                ),
              );
            },
            child: SingleChildScrollView(
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
                      data.images[0].src,
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
                  /* Container(
                    margin: EdgeInsets.only(top: 4, left: 4),
                    width: getProportionateScreenWidth(130.0),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text(
                          "\$${data.regularPrice}",
                          style: TextStyle(
                            fontSize: 14,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "\$${data.salePrice}",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),*/
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
