import 'package:flutter_online_shop/components/form_helper.dart';
import 'package:flutter_online_shop/models/customer_detail_model.dart';
import 'package:flutter_online_shop/provider/cart_provider.dart';
import 'package:flutter_online_shop/screens/base_page/checkout_base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_online_shop/screens/home1/home_screen_final.dart';
import 'package:flutter_online_shop/screens/payment/payment_methods.dart';
import 'package:flutter_online_shop/size_config.dart';
import 'package:provider/provider.dart';

class VerifyAddress extends CheckoutBasePage {
  @override
  _VerifyAddressState createState() => _VerifyAddressState();
}

class _VerifyAddressState extends CheckoutBasePageState<VerifyAddress> {
  @override
  void initState() {
    super.initState();
    currentPage = 0;
    var cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.fetchShippingDetails();
  }

  @override
  Widget pageUI() {
    return Consumer<CartProvider>(builder: (context, customerModel, child) {
      if (customerModel.customerDetailsModel.id != null) {
        return _formUI(customerModel.customerDetailsModel);
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }

  Widget _formUI(CustomerDetailsModel model) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: FormHelper.fieldLabel("First Name"),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: FormHelper.fieldLabel("Last Name"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child:
                          FormHelper.fieldLabelValue(context, model.firstName),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child:
                            FormHelper.fieldLabelValue(context, model.lastName),
                      ),
                    ),
                  ],
                ),
                FormHelper.fieldLabel("Address"),
                FormHelper.fieldLabelValue(context, model.shipping.address1),
                FormHelper.fieldLabel("Apartment, suite, etc."),
                FormHelper.fieldLabelValue(context, model.shipping.address2),
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: FormHelper.fieldLabel("Country"),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: FormHelper.fieldLabel("State"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: FormHelper.fieldLabelValue(
                          context, model.shipping.country),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FormHelper.fieldLabelValue(
                            context, model.shipping.state),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: FormHelper.fieldLabel("City"),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: FormHelper.fieldLabel("Postcode"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: FormHelper.fieldLabelValue(
                          context, model.shipping.city),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FormHelper.fieldLabelValue(
                            context, model.shipping.postCode),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20.0)),
                Center(
                  child: FormHelper.saveButton("Next", () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PaymentMethodsWidget()));
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
