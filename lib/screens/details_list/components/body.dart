import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_online_shop/components/default_button.dart';
import 'package:flutter_online_shop/constants.dart';
import 'package:flutter_online_shop/models/iphone_items.dart';
import 'package:flutter_online_shop/screens/details_list/components/similar_products.dart';

import '../../../size_config.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatelessWidget {
  final IPhoneItem iPhoneItem;

  const Body({Key key, @required this.iPhoneItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: getProportionateScreenHeight(20.0),
        ),
        ProductImages(iPhoneItem: iPhoneItem),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                iPhoneItem: iPhoneItem,
                pressOnSeeMore: () {},
              ),
              Column(
                //was Surrounded with TopRoundContainer with grey color
                children: [
                  //DetailsReviews(),
                  //SimilarProducts(iPhoneItem: iPhoneItem),
                  TopRoundedContainer(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: SizeConfig.screenWidth * 0.15,
                        right: SizeConfig.screenWidth * 0.15,
                        bottom: getProportionateScreenWidth(40),
                        top: getProportionateScreenWidth(15),
                      ),
                      child: DefaultButton(
                        text: "Add To Cart",
                        press: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/*class DetailsReviews extends StatelessWidget {
  const DetailsReviews({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TopRoundedContainer(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Text(
                  'Details',
                  style: TextStyle(
                      fontFamily: 'Muli',
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(25.0),
                ),
                Text(
                  'Reviews',
                  style: TextStyle(
                    fontFamily: 'Muli',
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(10.0),
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            height: getProportionateScreenHeight(200.0),
            width: getProportionateScreenWidth(350.0),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit,'
              ' sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
              'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
              ' Duis aute irure dolor in reprehenderit in voluptate velit esse cillum',
              style: TextStyle(
                fontFamily: 'Muli',
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}*/
