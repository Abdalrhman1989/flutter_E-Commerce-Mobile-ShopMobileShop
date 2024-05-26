import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_online_shop/models/payment_method.dart';
import 'package:flutter_online_shop/size_config.dart';

class PaymentMethodListItem extends StatelessWidget {
  PaymentMethod paymentMethod;

  PaymentMethodListItem({Key key, this.paymentMethod}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).accentColor,
      focusColor: Theme.of(context).accentColor,
      highlightColor: Theme.of(context).primaryColor,
      onTap: () {
        if (this.paymentMethod.isRouteRedirect) {
          Navigator.of(context).pushNamed(this.paymentMethod.route);
        } else {
          this.paymentMethod.onTap();
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: Theme.of(context).focusColor.withOpacity(0.1),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).focusColor.withOpacity(0.1),
              blurRadius: 5.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: getProportionateScreenHeight(60.0),
              width: getProportionateScreenWidth(60.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
                image: DecorationImage(
                    image: AssetImage(
                      paymentMethod.logo,
                    ),
                    fit: BoxFit.fill),
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(15.0),
            ),
            Flexible(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          paymentMethod.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text(
                          paymentMethod.description,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(8.0),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: Theme.of(context).focusColor,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
