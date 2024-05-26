// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:flutter_online_shop/provider/paypal_payment_service.dart';
// import 'package:flutter_online_shop/size_config.dart';
//
// class PaypalPaymentScreen extends StatefulWidget {
//   static String routeName = "/paypal";
//   @override
//   _PaypalPaymentScreenState createState() => _PaypalPaymentScreenState();
// }
//
// class _PaypalPaymentScreenState extends State<PaypalPaymentScreen> {
//   InAppWebViewController webViewController;
//   String url = "";
//   double progress = 0;
//   GlobalKey<ScaffoldState> scaffoldKey;
//
//   String checkoutURL;
//   String executeURL;
//   String accessToken;
//
//   PayPalService payPalService;
//
//   @override
//   void initState() {
//     super.initState();
//     payPalService = new PayPalService();
//     this.scaffoldKey = new GlobalKey<ScaffoldState>();
//
//     Future.delayed(Duration.zero, () async {
//       try {
//         accessToken = await payPalService.getAccessToken();
//         final transactions = payPalService.getOrderParams(context);
//         final response =
//             await payPalService.createPaypalPayment(transactions, accessToken);
//
//         if (response != null) {
//           setState(() {
//             checkoutURL = response["approvalUrl"];
//             executeURL = response["executeUrl"];
//           });
//         }
//       } catch (e) {
//         print('Exception: ' + e.toString());
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (checkoutURL != null) {
//       return Scaffold(
//         key: scaffoldKey,
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           centerTitle: true,
//           title: Text(
//             "PayPal payment",
//             style: Theme.of(context).textTheme.headline6.merge(
//                   TextStyle(letterSpacing: 1.3),
//                 ),
//           ),
//         ),
//         body: Stack(
//           children: [
//             InAppWebView(
//               initialUrlRequest: URLRequest(
//                 url: Uri.parse(checkoutURL),
//               ),
//               initialOptions: new InAppWebViewGroupOptions(
//                 android: AndroidInAppWebViewOptions(
//                   textZoom: 120,
//                 ),
//               ),
//               onWebViewCreated: (InAppWebViewController controller) {
//                 webViewController = controller;
//               },
//               onLoadStart:
//                   (InAppWebViewController controller, Uri requestURL) async {
//                 String rqstURL = requestURL.toString();
//                 if (rqstURL.contains(payPalService.returnURL)) {
//                   final payerId = requestURL.queryParameters['PayerID'];
//                   if (payerId != null) {
//                     await payPalService
//                         .executePayment(executeURL, payerId, accessToken)
//                         .then((id) {
//                       print(id);
//                       Navigator.of(context).pop();
//                     });
//                   } else {
//                     Navigator.of(context).pop();
//                   }
//                   Navigator.of(context).pop();
//                 }
//                 if (rqstURL.contains(payPalService.cancelURL)) {
//                   Navigator.of(context).pop();
//                 }
//               },
//               onProgressChanged:
//                   (InAppWebViewController controller, int progress) {
//                 setState(() {
//                   this.progress = progress / 100;
//                 });
//               },
//             ),
//             progress < 1
//                 ? SizedBox(
//                     height: getProportionateScreenHeight(3.0),
//                     child: LinearProgressIndicator(
//                       value: progress,
//                       backgroundColor:
//                           Theme.of(context).accentColor.withOpacity(0.2),
//                     ),
//                   )
//                 : SizedBox()
//           ],
//         ),
//       );
//     } else {
//       return Scaffold(
//         key: scaffoldKey,
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           centerTitle: true,
//           title: Text(
//             "PayPal payment",
//             style: Theme.of(context).textTheme.headline6.merge(
//                   TextStyle(letterSpacing: 1.3),
//                 ),
//           ),
//         ),
//         body: Center(
//           child: Container(
//             child: CircularProgressIndicator(),
//           ),
//         ),
//       );
//     }
//   }
// }
