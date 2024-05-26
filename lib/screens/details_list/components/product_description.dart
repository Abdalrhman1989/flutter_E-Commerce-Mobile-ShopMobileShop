import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_online_shop/models/iphone_items.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key key,
    @required this.iPhoneItem,
    this.pressOnSeeMore,
  }) : super(key: key);

  final IPhoneItem iPhoneItem;
  final GestureTapCallback pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Center(
            child: Text(
              iPhoneItem.iphoneName,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(20.0),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              /*Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                width: getProportionateScreenWidth(64),
                decoration: BoxDecoration(
                  color:
                      //product.isFavourite ? Color(0xFFFFE6E6) :
                      Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: SvgPicture.asset(
                  "assets/icons/Heart Icon_2.svg",
                  color:
                      //product.isFavourite ? Color(0xFFFF4848) :
                      Color(0xFFDBDEE4),
                  height: getProportionateScreenWidth(16),
                ),
              ),*/
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: getProportionateScreenWidth(30.0),
                      height: getProportionateScreenHeight(30.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: kPrimaryColor),
                      child: IconButton(
                        icon: Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                        iconSize: 15.0,
                        onPressed: null,
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(10.0),
                    ),
                    Text(
                      iPhoneItem.id.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(10.0),
                    ),
                    Container(
                      width: getProportionateScreenWidth(30.0),
                      height: getProportionateScreenHeight(30.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: kPrimaryColor),
                      child: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        iconSize: 15.0,
                        onPressed: null,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(64),
          ),
          child: Text(
            iPhoneItem.availability,
            maxLines: 3,
            style: TextStyle(
              color: iPhoneItem.textColor,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: 10,
          ),
          child: Text("\$${iPhoneItem.price.toString()}"),
        )
      ],
    );
  }
}
