import 'package:flutter/material.dart';
import 'package:credit_card/credit_card_form.dart';
import 'package:credit_card/credit_card_model.dart';
import 'package:credit_card/credit_card_widget.dart';
import 'package:credit_card/flutter_credit_card.dart';

class PaymentPage extends StatefulWidget {
  static const String id = 'PaymentPage';
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String cardNumber = '';
  String expirydate = '';
  String cvvCode = '';
  String cardHolderName = '';
  bool isCvvFocused = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: Column(
        children: <Widget>[
          CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expirydate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: isCvvFocused,
            height: 200,
            width: MediaQuery.of(context).size.width,
            animationDuration: Duration(
              milliseconds: 1000,
            ),
          ),
          new OutlineButton(
            onPressed: null,
            shape: new RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)),
            child: Text(
              'Proceed to Pay',
              style: TextStyle(color: Colors.blueAccent),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: CreditCardForm(
              onCreditCardModelChange: onModelChange,
            ),
          ))
        ],
      )),
    );
  }
  void onModelChange(CreditCardModel model){
    setState(() {
      cardNumber=model.cardNumber;
      expirydate=model.expiryDate;
      cardHolderName=model.cardHolderName;
      cvvCode=model.cvvCode;
      isCvvFocused=model.isCvvFocused;
    });
  }
}
