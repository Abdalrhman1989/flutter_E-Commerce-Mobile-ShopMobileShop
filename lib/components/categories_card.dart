import 'package:flutter/material.dart';
import 'package:flutter_online_shop/constants.dart';
import 'package:flutter_online_shop/models/item.dart';
import 'package:flutter_online_shop/screens/categories_list/iphone_batteries/iphone_batteries_home.dart';
import 'package:flutter_online_shop/screens/categories_list/iphone_covers/iphone_covers_home.dart';
import 'package:flutter_online_shop/screens/categories_list/iphone_screens/iphone_screens_home.dart';
import 'package:flutter_online_shop/screens/categories_list/macbook_chargers/macbook_chargers_home.dart';
import 'package:flutter_online_shop/screens/categories_list/screen_protection/screen_protection_home.dart';
import 'package:flutter_online_shop/screens/categories_list/tools_and_equipment/tools_and_equipment_home.dart';
import 'package:flutter_online_shop/screens/categories_list/ipads/ipads_home.dart';
import 'package:flutter_online_shop/screens/categories_list/iphones/iphones_home.dart';
import 'package:flutter_online_shop/screens/categories_list/macbook_accessories/macbook_accessories_home.dart';
import 'package:flutter_online_shop/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoriesCard extends StatelessWidget {
  static String routeName = "/categories_card";

  _buildCategoryCard(context, int index) {
    return GestureDetector(
      onTap: () {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, IPhoneBatteriesHome.routeName);
            break;
          case 1:
            Navigator.pushNamed(context, IPhoneCoversHome.routeName);
            break;
          case 2:
            Navigator.pushNamed(context, IPhoneScreensHome.routeName);
            break;
          case 3:
            Navigator.pushNamed(context, ScreenProtection.routeName);
            break;
          case 4:
            Navigator.pushNamed(context, ToolsAndEquipment.routeName);
            break;
          case 5:
            Navigator.pushNamed(context, MacbookChargers.routeName);
            break;
          case 6:
            Navigator.pushNamed(context, MacbookAccessoriesHome.routeName);
            break;
          case 7:
            Navigator.pushNamed(context, IPhonesHome.routeName);
            break;
          case 8:
            Navigator.pushNamed(context, IPadsHome.routeName);
            break;
        }
      },
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: kPrimaryColor,
                      //offset: Offset(1, 2),
                      spreadRadius: 1.1,
                    ),
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image(
                  image: AssetImage(items[index].image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            left: 10.0,
            right: 10.0,
            bottom: 10.0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(7.0),
                  vertical: getProportionateScreenHeight(8.0)),
              child: Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      items[index].title,
                      style: TextStyle(
                        fontFamily: 'Muli',
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.fade,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

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
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'UBreak WeFix',
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
          ),
          itemBuilder: (context, int index) {
            return _buildCategoryCard(context, index);
          },
        ),
      ),
    );
  }
}
