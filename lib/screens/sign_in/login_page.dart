import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_online_shop/backend/api_service.dart';
import 'package:flutter_online_shop/backend/shared_service.dart';
import 'package:flutter_online_shop/components/form_helper.dart';
import 'package:flutter_online_shop/components/progress_hud.dart';
import 'package:flutter_online_shop/screens/home1/home_screen_final.dart';
import 'package:flutter_online_shop/size_config.dart';

class LoginPage extends StatefulWidget {
  static String routeName = "/log_in";

  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidePassword = true;
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  String username;
  String password;
  APIService apiService;

  @override
  void initState() {
    apiService = new APIService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  Widget _uiSetup(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).hintColor.withOpacity(0.3),
                        offset: Offset(0, 10),
                        blurRadius: 20,
                      )
                    ],
                  ),
                  child: Form(
                    key: globalKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: getProportionateScreenHeight(25.0),
                        ),
                        Text(
                          'Login',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(20.0),
                        ),
                        new TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (input) => username = input,
                          validator: (input) => !input.contains('@')
                              ? "Email should be valid"
                              : null,
                          decoration: new InputDecoration(
                              hintText: "Email Address",
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .accentColor
                                          .withOpacity(0.2))),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).accentColor)),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Theme.of(context).accentColor,
                              )),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(20.0),
                        ),
                        new TextFormField(
                          style:
                              TextStyle(color: Theme.of(context).accentColor),
                          keyboardType: TextInputType.text,
                          onSaved: (input) => password = input,
                          validator: (input) => input.length < 5
                              ? "Password should be more than 3 characters"
                              : null,
                          obscureText: hidePassword,
                          decoration: new InputDecoration(
                            hintText: "Password",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .accentColor
                                        .withOpacity(0.2))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).accentColor)),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Theme.of(context).accentColor,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              color: Theme.of(context)
                                  .accentColor
                                  .withOpacity(0.4),
                              icon: Icon(hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(30.0),
                        ),
                        FlatButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 80),
                          onPressed: () {
                            if (validateAndSave()) {
                              setState(() {
                                isApiCallProcess = true;
                              });
                              apiService
                                  .loginCustomer(username, password)
                                  .then((ret) {
                                setState(() {
                                  isApiCallProcess = false;
                                });
                                if (ret.success) {
                                  print(ret.data.token);
                                  print(ret.data.toJson());

                                  SharedService.setLoginDetails(ret);
                                  FormHelper.showMessage(
                                    context,
                                    "UbreakWeFix",
                                    "Login Successful!",
                                    "Ok",
                                    () {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              HomeScreenTest(selectedPage: 3),
                                        ),
                                        ModalRoute.withName("/homeTest"),
                                      );
                                    },
                                  );
                                } else {
                                  print(ret.data.token);
                                  print(ret.data.toJson());
                                  FormHelper.showMessage(
                                    context,
                                    "Ubreak WeFix",
                                    "Invalid Login! \nCheck email or password",
                                    "Ok",
                                    () {
                                      Navigator.of(context).pop();
                                    },
                                  );
                                }
                              });
                            }
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Theme.of(context).accentColor,
                          shape: StadiumBorder(),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(15.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
