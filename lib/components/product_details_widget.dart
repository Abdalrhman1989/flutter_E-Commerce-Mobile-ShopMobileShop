import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_online_shop/components/custom_stepper.dart';
import 'package:flutter_online_shop/components/expand_text.dart';
import 'package:flutter_online_shop/components/related_products_widget.dart';
import 'package:flutter_online_shop/models/cart_request_model.dart';
import 'package:flutter_online_shop/models/product_model.dart';
import 'package:flutter_online_shop/provider/cart_provider.dart';
import 'package:flutter_online_shop/provider/loader_provider.dart';
import 'package:flutter_online_shop/size_config.dart';
import 'package:provider/provider.dart';

class ProductDetailsWidget extends StatelessWidget {
  ProductDetailsWidget({Key key, this.data}) : super(key: key);

  final Product data;
  final CarouselController _controller = CarouselController();
  int quantity = 0;

  CartProducts cartProducts = new CartProducts();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20.0), vertical: 0.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                productImages(data.images, context),
                SizedBox(
                  height: getProportionateScreenHeight(10.0),
                ),
                Visibility(
                  visible: data.calculateDiscount() > 0,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(color: Colors.green),
                      child: Text(
                        '${data.calculateDiscount()}%OFF',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(5.0),
                ),
                Text(
                  data.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /*Text(
                      data.attributes != null && data.attributes.length > 0
                          ? (data.attributes[0].options.join("-").toString() +
                              "" +
                              data.attributes[0].name)
                          : "",
                      overflow: TextOverflow.ellipsis,
                    ),*/
                    Visibility(
                      visible: data.calculateDiscount() > 0,
                      child: Text(
                        'Kr ${data.regularPrice}',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ),
                    Text(
                      'Kr ${data.salePrice}',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightGreen,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomStepper(
                        lowerLimit: 1,
                        value: this.quantity,
                        iconSize: 22.0,
                        stepValue: 1,
                        upperLimit: 20,
                        onChanged: (value) {
                          cartProducts.quantity = value;
                        }),
                    FlatButton(
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      color: Color(0xFF3B54A4),
                      padding: EdgeInsets.all(15.0),
                      shape: StadiumBorder(),
                      onPressed: () {
                        Provider.of<LoaderProvider>(context, listen: false)
                            .setLoadingStatus(true);
                        var cartProvider =
                            Provider.of<CartProvider>(context, listen: false);
                        cartProducts.productId = data.id;
                        cartProvider.addToCart(cartProducts, (val) {
                          Provider.of<LoaderProvider>(context, listen: false)
                              .setLoadingStatus(false);
                          print(val);
                          final snackBar = SnackBar(
                            content: Text("Item added successfully!"),
                            duration: Duration(seconds: 2),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(5.0),
                ),
                ExpandText(
                    labelHeader: "Product Details",
                    shortDesc: data.shortDescription,
                    desc: data.description),
                Divider(),
                SizedBox(
                  height: getProportionateScreenHeight(10.0),
                ),
                RelatedProductsWidget(
                  labelName: 'Related Products',
                  products: this.data.relatedIds,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget productImages(List<Images> images, BuildContext buildContext) {
    return SizedBox(
      width: MediaQuery.of(buildContext).size.width, // to be edited later
      height: getProportionateScreenHeight(250.0),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: CarouselSlider.builder(
              itemCount: images.length,
              itemBuilder: (context, index, _) {
                return Container(
                  child: Center(
                    child: Image.network(
                      images[index].src,
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: true,
                viewportFraction: 1,
                aspectRatio: 1.0,
              ),
              carouselController: _controller,
            ),
          ),
          Positioned(
            top: 100.0,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                _controller.previousPage();
              },
            ),
          ),
          Positioned(
            top: 100.0,
            left: SizeConfig.screenWidth - 80,
            child: IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () {
                _controller.nextPage();
              },
            ),
          ),
        ],
      ),
    );
  }
}
