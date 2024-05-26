import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_online_shop/backend/shared_service.dart';
import 'package:flutter_online_shop/components/unauth_widget.dart';
import 'package:flutter_online_shop/models/login_model.dart';
import 'package:flutter_online_shop/screens/orders/orders_page.dart';
import 'package:flutter_online_shop/screens/sign_in/sign_in_screen.dart';
import 'package:flutter_online_shop/utils/cart_icons.dart';

class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class OptionList {
  String optionTitle;
  String optionSubTitle;
  IconData optionIcon;
  Function onTap;

  OptionList(
    this.optionIcon,
    this.optionTitle,
    this.optionSubTitle,
    this.onTap,
  );
}

class _MyAccountState extends State<MyAccount> {
  List<OptionList> options = new List<OptionList>();

  @override
  void initState() {
    super.initState();
    options.add(
      new OptionList(Icons.shopping_bag, "Orders", "Check My Orders", () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => OrdersPage()));
      }),
    );
    options.add(
      new OptionList(Icons.edit, "Edit Profile", "Update your profile", () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => OrdersPage()));
      }),
    );
    options.add(
      new OptionList(
          Icons.power_settings_new, "Sign out", "Sign out from your account",
          () {
        SharedService.logout().then((value) => {
              setState(() {
                Navigator.pushReplacementNamed(
                  context,
                  SignInScreen.routeName,
                );
              })
            });
      }),
    );
    /* options.add(
      new OptionList(Icons.notifications, "Notifications",
          "Check the latest notifications", () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => OrdersPage()));
      }),
    );*/
  }

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
      future: SharedService.isLoggedIn(),
      builder: (BuildContext context, AsyncSnapshot<bool> loginModel) {
        if (loginModel.hasData) {
          if (loginModel.data) {
            return _listView(context);
          } else {
            return UnAuthWidget();
          }
        }
        return Container();
      },
    );
  }

  Widget _buildRow(OptionList optionList, int index) {
    return new Padding(
      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.all(10),
          child: Icon(
            optionList.optionIcon,
            size: 30,
          ),
        ),
        onTap: () {
          return optionList.onTap();
        },
        title: new Text(
          optionList.optionTitle,
          style: new TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Padding(
          padding: EdgeInsets.only(top: 5),
          child: Text(
            optionList.optionSubTitle,
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: 14,
            ),
          ),
        ),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
    );
  }

  Widget _listView(BuildContext context) {
    return new FutureBuilder(
      future: SharedService.loginDetails(),
      builder:
          (BuildContext context, AsyncSnapshot<LoginResponseModel> loginModel) {
        if (loginModel.hasData) {
          return ListView(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome, ${loginModel.data.data.firstName}!",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              ListView.builder(
                itemCount: options.length,
                physics: ScrollPhysics(),
                padding: EdgeInsets.all(8.0),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(16.0),
                    ),
                    child: _buildRow(options[index], index),
                  );
                },
              )
            ],
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
