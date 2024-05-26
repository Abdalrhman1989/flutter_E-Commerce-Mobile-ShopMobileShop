import 'package:flutter/material.dart';
import 'package:flutter_online_shop/components/categories_card.dart';
import 'package:flutter_online_shop/models/iphone_items.dart';
import 'package:flutter_online_shop/screens/categories_list/iphone_covers/iphone_covers_home.dart';
import 'package:flutter_online_shop/screens/categories_list/iphone_screens/iphone_screens_home.dart';
import 'package:flutter_online_shop/screens/categories_list/screen_protection/screen_protection_home.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
            title: "Categories",
            press: () {
              Navigator.pushNamed(context, CategoriesCard.routeName);
            },
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                image:
                    "assets/images/iphones/iPhone_XR_Reservedele_-_Phone-Parts.dk_1.png",
                category: "iPhone Screens",
                numOfBrands: 18,
                press: () {
                  Navigator.pushNamed(context, IPhoneScreensHome.routeName);
                },
              ),
              SpecialOfferCard(
                image:
                    "assets/images/iphone_covers/iphone-11-cover-anti-shock-5ab.jpg",
                category: "iPhone Covers",
                numOfBrands: 24,
                press: () {
                  Navigator.pushNamed(context, IPhoneCoversHome.routeName);
                },
              ),
              SpecialOfferCard(
                image: "assets/images/macbook/macbook_batteri_oversigt_1.png",
                category: "Macbook Batteries",
                numOfBrands: 5,
                press: () {},
              ),
              SpecialOfferCard(
                image:
                    "assets/images/screen_protection/iphone-6-plus-6s-plus-9d-curved-edge-haerdet-beskyttelsesglas-5-5-7a8.jpg",
                category: "Screen protection",
                numOfBrands: 12,
                press: () {
                  Navigator.pushNamed(context, ScreenProtection.routeName);
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key key,
    @required this.category,
    @required this.image,
    @required this.numOfBrands,
    @required this.press,
  }) : super(key: key);

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(200),
          height: getProportionateScreenWidth(100),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15.0),
                    vertical: getProportionateScreenWidth(10),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "$numOfBrands Brands")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
