import 'package:flutter/material.dart';
import 'package:flutter_online_shop/constants.dart';
import 'package:flutter_online_shop/models/item.dart';
import 'package:flutter_online_shop/screens/home1/components/special_offers.dart';
import 'package:flutter_svg/svg.dart';
import '../../size_config.dart';

class SeeMoreSpecialOffer extends StatelessWidget {
  static String routeName = "/special_offer_see_more";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/back.svg"),
          color: kSecondaryColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'UBreak WeFix',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
            letterSpacing: 1.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _buildGrid(),
      ),
    );
  }

  GridView _buildGrid() {
    return GridView.builder(
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
        ),
        itemBuilder: (context, index) {
          return SpecialOfferCard(
            press: null,
            category: items[index].title,
            numOfBrands: items[index].id,
            image: items[index].image,
          );
        });
  }
}
