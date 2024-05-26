import 'package:flutter/material.dart';
import 'package:flutter_online_shop/constants.dart';
import 'package:flutter_online_shop/models/iphone_items.dart';
import 'package:flutter_svg/svg.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsListScreen extends StatelessWidget {
  static String routeName = "/details_list";

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments args =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: //CustomAppBar(rating: 4.8),
          AppBar(
        title: Text(
          "UBreak WeFix",
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/back.svg"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Body(iPhoneItem: args.iPhoneItem),
    );
  }
}

class ProductDetailsArguments {
  final IPhoneItem iPhoneItem;

  ProductDetailsArguments({@required this.iPhoneItem});
}
