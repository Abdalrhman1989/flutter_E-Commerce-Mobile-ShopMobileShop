import 'package:flutter/material.dart';
import 'package:flutter_online_shop/models/product_model.dart';
import 'package:flutter_online_shop/screens/details_backend/products_details_page.dart';
import 'package:flutter_online_shop/size_config.dart';

class CategoriesCardBackend extends StatelessWidget {
  CategoriesCardBackend({Key key, this.data}) : super(key: key);
  final Product data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetails(
              product: data,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFF8F8F8),
              blurRadius: 15.0,
              spreadRadius: 10.0,
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Visibility(
                    visible: data.calculateDiscount() > 0,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: Text(
                          '${data.calculateDiscount()}% OFF',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30.0,
                          backgroundColor: Color(0xFFE65829).withAlpha(40),
                        ),
                        Image.network(
                          data.images.length > 0
                              ? data.images[0].src
                              : "https://www.freeiconspng.com/uploads/no-image-icon-21.png",
                          height: getProportionateScreenHeight(160.0),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(5.0),
                  ),
                  Text(
                    data.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: data.salePrice != data.regularPrice,
                        child: Text(
                          "\Kr ${data.regularPrice}",
                          style: TextStyle(
                            fontSize: 14.0,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(5.0),
                      ),
                      Text(
                        "\Kr ${data.salePrice}",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
