import 'package:flutter/material.dart';
import 'package:flutter_online_shop/models/iphone_items.dart';
import 'package:flutter_online_shop/screens/details_list/details_screen.dart';
import '../size_config.dart';

class ListViewWidget extends StatelessWidget {
  final IPhoneItem iPhoneItem;
  final List<IPhoneItem> categoryName;
  const ListViewWidget({
    @required this.iPhoneItem,
    @required this.categoryName,
    Key key,
  }) : super(key: key);
  _buildBatteryCard(BuildContext context) {
    List<Widget> itemsList = [];
    categoryName.forEach((IPhoneItem iPhoneItem) {
      itemsList.add(
        GestureDetector(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                width: 1.0,
                color: Colors.grey,
              ),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(1, 0),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image(
                      image: AssetImage(iPhoneItem.iphoneImage),
                      height: getProportionateScreenHeight(150.0),
                      width: getProportionateScreenWidth(150.0),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          iPhoneItem.iphoneName, //Changed this
                          style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: 'Muli',
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(4.0),
                        ),
                        Text(
                          iPhoneItem.availability,
                          style: TextStyle(
                            color: iPhoneItem.textColor,
                            fontSize: 16.0,
                            fontFamily: 'Muli',
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(4.0),
                        ),
                        Text(
                          '\$${iPhoneItem.price}',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'Muli',
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          onTap: () => Navigator.pushNamed(
            context,
            DetailsListScreen.routeName,
            arguments: ProductDetailsArguments(
              iPhoneItem: iPhoneItem,
            ),
          ),
        ),
      );
    });
    return Column(
      children: itemsList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(physics: ScrollPhysics(), shrinkWrap: true, children: [
      Container(
        margin: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBatteryCard(context),
          ],
        ),
      ),
    ]);
  }
}
