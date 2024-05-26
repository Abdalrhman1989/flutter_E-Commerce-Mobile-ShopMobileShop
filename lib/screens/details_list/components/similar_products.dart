import 'package:flutter/material.dart';
import 'package:flutter_online_shop/models/iphone_items.dart';
import 'package:flutter_online_shop/screens/details_list/components/top_rounded_container.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SimilarProducts extends StatelessWidget {
  const SimilarProducts({
    Key key,
    @required this.iPhoneItem,
  }) : super(key: key);

  final IPhoneItem iPhoneItem;

  @override
  Widget build(BuildContext context) {
    return TopRoundedContainer(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
            ),
            child: Text(
              'Similar Products',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: getProportionateScreenWidth(150.0),
                height: getProportionateScreenHeight(250.0),
                child: GestureDetector(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(iPhoneItem.iphoneImage),
                      Text(
                        iPhoneItem.iphoneName,
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Muli',
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$${iPhoneItem.price.toString()}',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 18.0,
                            fontFamily: 'Muli',
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: getProportionateScreenWidth(150.0),
                height: getProportionateScreenHeight(250.0),
                child: GestureDetector(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        iPhoneItem.iphoneImage,
                      ),
                      Text(
                        iPhoneItem.iphoneName,
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Muli',
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$${iPhoneItem.price.toString()}',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 18.0,
                            fontFamily: 'Muli',
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
