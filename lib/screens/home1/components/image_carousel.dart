import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_online_shop/size_config.dart';

class ImageCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(200.0),
      width: getProportionateScreenWidth(350.0),
      child: Carousel(
        images: [
          ExactAssetImage("assets/images/banner-1.png"),
          ExactAssetImage("assets/images/banner-2.png"),
          ExactAssetImage("assets/images/banner-3.png"),
        ],
        dotSize: 4.0,
        dotSpacing: 15.0,
        dotColor: Colors.blueAccent,
        indicatorBgPadding: 5.0,
        dotBgColor: Colors.white.withOpacity(0.5),
        borderRadius: true,
      ),
    );
  }
}
