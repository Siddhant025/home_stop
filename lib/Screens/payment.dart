import 'package:flutter/material.dart';
import 'package:home_stop/Screens/shopping_store.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'shop_page.dart';
import 'package:home_stop/constants.dart';
import 'package:provider/provider.dart';

class PaymentPage extends StatefulWidget {
  static const String id = 'PaymentPage';
  PaymentPage({this.price,this.logout,this.Shopname,this.name,this.index,this.Phoneno,this.thumbnail,this.email});
  final int price;
  final String name;
  final String email;
  final String thumbnail;
  final String Shopname;
  final int index;
  final int Phoneno;
  final bool logout;
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  Razorpay _razorpay;

  Future<bool> _onBackPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Shopping(
          name: widget.name,
          email: widget.email,
          logout: widget.logout,
        ),
      ),
    );
    setState(() {
      Provider.of<SelectedList>(context, listen: false).selecteditem.clear();
    });
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(msg: "SUCCESS: " + response.paymentId);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR " + response.code.toString() + "  " + response.message);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: "External WALLET " + response.walletName);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() {
    var options = {
      'key': 'rzp_test_JqWYqG3vQnR1dF',
      'amount': widget.price * 100,
      'name': 'Homestop',
      'description': 'Payment Gateway',
      'prefill': {'contact': '', 'email': ''},
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }

  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Online Payment Gateway',
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LimitedBox(
                maxWidth: 150,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixText: widget.price.toString(),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              RaisedButton(
                color: Colors.teal,
                onPressed: () {
                  openCheckout();
                },
                child: Text(
                  'Make Payment',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
