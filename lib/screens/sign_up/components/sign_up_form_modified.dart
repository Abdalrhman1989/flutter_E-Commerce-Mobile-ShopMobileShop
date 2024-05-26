import 'package:flutter/material.dart';
import 'package:flutter_online_shop/backend/api_service.dart';
import 'package:flutter_online_shop/components/custom_surfix_icon.dart';
import 'package:flutter_online_shop/components/default_button.dart';
import 'package:flutter_online_shop/components/form_error.dart';
import 'package:flutter_online_shop/models/customer_detail_model.dart';
import 'package:flutter_online_shop/models/customer_model.dart';
import 'package:flutter_online_shop/screens/complete_profile/complete_profile_screen.dart';
import 'package:flutter_online_shop/components/form_helper.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:flutter_online_shop/components/progress_hud.dart';
import 'package:flutter_online_shop/screens/sign_in/sign_in_screen.dart';

class SignUpFormModified extends StatefulWidget {
  @override
  _SignUpFormModifiedState createState() => _SignUpFormModifiedState();
}

class _SignUpFormModifiedState extends State<SignUpFormModified> {
  //https://www.youtube.com/watch?v=HN5ANMGAYo8&t=148s
  APIService apiService;
  CustomerModel customerModel;
  bool isApiCallProcess = false;
  CustomerDetailsModel customerDetailsModel;

  final _formKey = GlobalKey<FormState>();
  String firstName;
  String lastName;
  String email;
  String password;
  String confirmPassword;
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
    customerModel = new CustomerModel();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            buildFirstNameFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildLastNameFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildEmailFormField(),
            //SizedBox(height: getProportionateScreenHeight(30)),
            // buildPhoneNumberFormField(),
            // SizedBox(height: getProportionateScreenHeight(30)),
            // buildAddressFormField(),
            // SizedBox(height: getProportionateScreenHeight(30)),
            // buildCountryFormField(),
            // SizedBox(height: getProportionateScreenHeight(30)),
            // buildPostCodeFormField(),
            // SizedBox(height: getProportionateScreenHeight(30)),
            // buildAddress2FormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildPasswordFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildConfirmPassFormField(),
            FormError(errors: errors),
            SizedBox(height: getProportionateScreenHeight(40)),
            SizedBox(height: getProportionateScreenHeight(10)),
            DefaultButton(
              text: "Continue",
              press: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  print(customerModel.toJson());
                  setState(() {
                    isApiCallProcess = true;
                  });
                  apiService.createCustomer(customerModel).then((ret) {
                    setState(() {
                      isApiCallProcess = false;
                    });
                    if (ret) {
                      FormHelper.showMessage(
                        context,
                        "UBreak WeFix",
                        "Registration Successful!",
                        "Welcome!",
                        () => Navigator.pushReplacementNamed(
                            context, SignInScreen.routeName),
                      );
                    } else {
                      FormHelper.showMessage(
                        context,
                        "UBreak WeFix",
                        "Email already registered!",
                        "Sign in!",
                        () => Navigator.pushReplacementNamed(
                            context, SignInScreen.routeName),
                      );
                    }
                  });
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

  TextFormField buildConfirmPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => confirmPassword = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty &&
            this.customerModel.password == confirmPassword) {
          removeError(error: kMatchPassError);
        }
        confirmPassword = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if ((this.customerModel.password != value)) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => this.customerModel.password = newValue,
      //Changed from password
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 6) {
          removeError(error: kShortPassError);
        }
        this.customerModel.password = value; //Changed from password
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 6) {
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
      onSaved: (newValue) => this.customerModel.email = newValue,
      //Changed email here
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

  TextFormField buildLastNameFormField() {
    return TextFormField(
      onSaved: (newValue) => this.customerModel.lastName = newValue,
      decoration: InputDecoration(
        labelText: "Last Name",
        hintText: "Enter your last name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      onSaved: (newValue) => this.customerModel.firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNameNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNameNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "First Name",
        hintText: "Enter your first name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      onSaved: (newValue) => this.customerModel.shipping.address1 = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Address",
        hintText: "Enter your phone address",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => this.customerModel.billing.phone = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildCountryFormField() {
    return TextFormField(
      onSaved: (newValue) => this.customerModel.shipping.country = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kGeneralError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kGeneralError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Country",
        hintText: "Enter your country",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/country.svg"),
      ),
    );
  }

  TextFormField buildAddress2FormField() {
    return TextFormField(
      onSaved: (newValue) => this.customerModel.shipping.address2 = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kGeneralError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kGeneralError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Apartment",
        hintText: "Enter your apartment location",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/apartment.svg"),
      ),
    );
  }

  TextFormField buildPostCodeFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => this.customerModel.shipping.postCode = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kGeneralError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kGeneralError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "PostCode",
        hintText: "Enter your PostCode",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/postcode.svg"),
      ),
    );
  }
}
