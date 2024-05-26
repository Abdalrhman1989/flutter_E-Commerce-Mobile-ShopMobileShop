import 'package:flutter/material.dart';
import 'package:flutter_online_shop/backend/config.dart';
import 'package:flutter_online_shop/screens/home1/components/widget_home_categories.dart';
import 'package:flutter_online_shop/screens/home1/components/categories_modified_gridview.dart';
import 'package:flutter_online_shop/screens/home1/components/widget_home_products.dart';
import 'package:flutter_online_shop/screens/home1/components/image_carousel.dart';
import 'package:flutter_online_shop/screens/tags_page/tag_page_backend.dart';
import 'package:flutter_online_shop/screens/tags_page/tag_page_test.dart';
import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenWidth(10)),
            //DiscountBanner(),
            ImageCarousel(),
            SizedBox(height: getProportionateScreenWidth(30)),
            // SpecialOffers(),
            CategoriesWidget(),
            SizedBox(height: getProportionateScreenWidth(30)),
            WidgetHomeProducts(
              labelName: "iPhone Batteries",
              tagName: Config.iphoneBatteriesTagId,
              press: () {},
            ),
            SizedBox(height: getProportionateScreenWidth(30)),
            WidgetHomeProducts(
              labelName: "iPhone Covers",
              tagName: Config.iphoneCoversTagId,
              press: () {},
            ),
            /*WidgetHomeProducts(
              labelName: "iPhone Screens",
              tagName: Config.iphoneScreensTagId,
              press: () {},
            ),*/
            SizedBox(height: getProportionateScreenWidth(30)),
            WidgetHomeProducts(
              labelName: "Cables",
              tagName: Config.cablesTagId,
              press: () {},
            ),
            SizedBox(height: getProportionateScreenWidth(30)),
            WidgetHomeProducts(
              labelName: "Micro Cables",
              tagName: Config.microbCablesTagId,
              press: () {},
            ),
            SizedBox(height: getProportionateScreenWidth(30)),
            WidgetHomeProducts(
              labelName: "Type-C Cables",
              tagName: Config.typecCablesTagId,
              press: () {},
            ),
            SizedBox(height: getProportionateScreenWidth(30)),
            WidgetHomeProducts(
              labelName: "Mobile Holders",
              tagName: Config.mobileHolderTagId,
              press: () {},
            ),
            SizedBox(height: getProportionateScreenWidth(30)),
            WidgetHomeProducts(
              labelName: "Screen Protection",
              tagName: Config.screenProtectionTagId,
              press: () {},
            ),
            SizedBox(height: getProportionateScreenWidth(30)),
            WidgetHomeProducts(
              labelName: "Macbook Air Battery",
              tagName: Config.macbookAirBatteriesTagId,
              press: () {},
            ),
            SizedBox(height: getProportionateScreenWidth(30)),
            WidgetHomeProducts(
              labelName: "Macbook Chargers",
              tagName: Config.macbookChargerTagId,
              press: () {},
            ),
            SizedBox(height: getProportionateScreenWidth(30)),
            WidgetHomeProducts(
              labelName: "Macbook Pro Battery",
              tagName: Config.macbookProBatteriesTagId,
              press: () {},
            ),
            SizedBox(height: getProportionateScreenWidth(30)),
            WidgetHomeProducts(
              labelName: "iPad Covers",
              tagName: Config.ipadCoversTagId,
              press: () {},
            ),
            SizedBox(height: getProportionateScreenWidth(30)),
            WidgetHomeProducts(
              labelName: "Tools and Equipment",
              tagName: Config.toolsAndEquipmentsTagId,
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
