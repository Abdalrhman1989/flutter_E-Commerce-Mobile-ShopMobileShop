import 'package:flutter/material.dart';
import 'package:flutter_online_shop/models/item.dart';
import 'package:flutter_online_shop/models/iphone_items.dart';
import 'package:flutter_online_shop/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants.dart';
import '../../../components/categories_list_view.dart';

class IPhonesHome extends StatelessWidget {
  static String routeName = '/iphones_home';

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
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    items[7].title,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                ListViewWidget(
                  iPhoneItem: iphones[index],
                  categoryName: iphones,
                ),
              ],
            );
          }),
    );
  }
}
