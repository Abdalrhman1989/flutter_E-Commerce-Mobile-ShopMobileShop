import 'package:flutter/material.dart';
import 'package:flutter_online_shop/backend/api_service.dart';
import 'package:flutter_online_shop/backend/shared_service.dart';
import 'package:flutter_online_shop/components/custom_surfix_icon.dart';
import 'package:flutter_online_shop/components/form_error.dart';
import 'package:flutter_online_shop/helper/keyboard.dart';
import 'package:flutter_online_shop/screens/forgot_password/forgot_passwrod_screen.dart';
import 'package:flutter_online_shop/screens/home1/home_screen_final.dart';
import 'package:flutter_online_shop/screens/log_in_success/log_in_sucess_screen.dart';
import 'package:flutter_online_shop/components/progress_hud.dart';
import 'package:flutter_online_shop/components/form_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  bool isApiCallProcess = false;
  APIService apiService;
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool remember = false;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  void initState() {
    apiService = new APIService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            buildEmailFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildPasswordFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            Row(
              children: [
                Checkbox(
                  value: remember,
                  activeColor: kPrimaryColor,
                  onChanged: (value) {
                    setState(() async {
                      remember = value;
                      // SharedPreferences prefs =
                      //     await SharedPreferences.getInstance();
                      // prefs.setString('email', email);
                      // prefs.setString('password', password);
                    });
                  },
                ),
                Text("Remember me"),
                Spacer(),
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ForgotPasswordScreen())),
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
            FormError(errors: errors),
            SizedBox(height: getProportionateScreenHeight(20)),
            DefaultButton(
              text: "Continue",
              press: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  setState(() {
                    isApiCallProcess = true;
                  });
                  apiService.loginCustomer(email, password).then((ret) async {
                    setState(() {
                      isApiCallProcess = false;
                    });
                    if (ret.success) {
                      // print(ret.data.token);
                      // print(ret.data.toJson());

                      SharedService.setLoginDetails(ret);

                      FormHelper.showMessage(
                          context, "UBreak WeFix", "Success!", "ok", () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                HomeScreenTest(selectedPage: 0),
                          ),
                          ModalRoute.withName("/homeTest"),
                        );
                      });
                    } else {
                      // print(ret.data.token);
                      // print(ret.data.toJson());
                      FormHelper.showMessage(
                        context,
                        "UBreak WeFix",
                        "Invalid Login!",
                        "ok",
                        () {
                          Navigator.of(context).pop();
                        },
                      );
                    }
                  });
                  // if all are valid then go to success screen
                  // Navigator.pushReplacementNamed(
                  //     context, LoginSuccessScreen.routeName);
                  KeyboardUtil.hideKeyboard(context);
                }
              },
            ),
          ],
        ),
      ),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
