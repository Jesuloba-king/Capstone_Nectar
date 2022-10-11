// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutterwave_standard/flutterwave.dart';
import 'package:flutterwave_standard/models/subaccount.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:uuid/uuid.dart';

import 'package:capstone/widget/app_buttons.dart';
import 'package:capstone/widget/app_texts.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({
    Key? key,
    required this.amount,
    required this.email,
    required this.name,
  }) : super(key: key);

  final String amount;
  final String email;
  final String name;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<PaymentPage> {
  final formKey = GlobalKey<FormState>();
  final amountController = TextEditingController();
  final currencyController = TextEditingController();
  final narrationController = TextEditingController();

  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  String selectedCurrency = "";

  bool isTestMode = true;
  final pbk = "FLWPUBK_TEST-932d9a6f334911fe4ae2b4eed964e330-X";
  @override
  void initState() {
    super.initState();

    details();
  }

  void details() {
    setState(() {
      amountController.text = widget.amount;
      emailController.text = widget.email;
      currencyController.text = "NGN";
      narrationController.text = "Payment for items in cart";

      phoneNumberController.text = "0902620185";
    });
  }

  @override
  Widget build(BuildContext context) {
    currencyController.text = selectedCurrency;

    return Scaffold(
      appBar: AppBar(
          title: AppText(
              text: "Check Out",
              fontSize: Adaptive.sp(18),
              color: Colors.black,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600)),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Form(
          key: formKey,
          child: ListView(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: amountController,
                  style: const TextStyle(color: Colors.black),
                  readOnly: true,
                  decoration: const InputDecoration(hintText: "Amount"),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: currencyController,
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(color: Colors.black),
                  readOnly: true,
                  onTap: _openBottomSheet,
                  decoration: const InputDecoration(
                    hintText: "Currency",
                  ),
                  validator: (value) =>
                      value!.isNotEmpty ? null : "Currency is required",
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: emailController,
                  readOnly: true,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    hintText: "Email",
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: phoneNumberController,
                  readOnly: true,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    hintText: "Phone Number",
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: appButton(
                  onPressed: _onPressed,
                  btnColor: Colors.blue,
                  child: AppText(
                    text: "Pay ${widget.amount}",
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _onPressed() {
    if (formKey.currentState!.validate()) {
      _handlePaymentInitialization();
    }
  }

  _handlePaymentInitialization() async {
    final style = FlutterwaveStyle(
      appBarText: "Item Payment",
      buttonColor: const Color(0xffd0ebff),
      buttonTextStyle: const TextStyle(
        color: Colors.deepOrangeAccent,
        fontSize: 16,
      ),
      appBarColor: Colors.white,
      dialogCancelTextStyle: const TextStyle(
        color: Colors.brown,
        fontSize: 18,
      ),
      dialogContinueTextStyle: const TextStyle(
        color: Colors.purpleAccent,
        fontSize: 18,
      ),
      mainBackgroundColor: Colors.indigo,
      mainTextStyle:
          const TextStyle(color: Colors.indigo, fontSize: 19, letterSpacing: 2),
      dialogBackgroundColor: Colors.greenAccent,
      // appBarIcon: const Icon(Icons.message, color: Colors.purple),
      buttonText: "Pay $selectedCurrency${widget.amount}",
      appBarTitleTextStyle: const TextStyle(
        color: Colors.purpleAccent,
        fontSize: 18,
      ),
    );

    final Customer customer = Customer(
        name: widget.name,
        phoneNumber: phoneNumberController.text.toString().trim(),
        email: widget.email);

    final subAccounts = [
      SubAccount(
          id: "RS_1A3278129B808CB588B53A14608169AD",
          transactionChargeType: "flat",
          transactionPercentage: 25),
      SubAccount(
          id: "RS_C7C265B8E4B16C2D472475D7F9F4426A",
          transactionChargeType: "flat",
          transactionPercentage: 50)
    ];

    final Flutterwave flutterwave = Flutterwave(
        context: context,
        style: style,
        publicKey: pbk,
        currency: selectedCurrency,
        redirectUrl: "https://google.com",
        txRef: const Uuid().v1(),
        amount: amountController.text.toString().trim(),
        customer: customer,
        subAccounts: subAccounts,
        paymentOptions: "card, payattitude, barter",
        customization: Customization(title: "Test Payment"),
        isTestMode: false);
    final ChargeResponse response = await flutterwave.charge();
    // ignore: unnecessary_null_comparison
    if (response != null) {
      showLoading(response.status!);
      print("${response.toJson()}");
    } else {
      showLoading("No Response!");
    }
  }

  void _openBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return _getCurrency();
        });
  }

  Widget _getCurrency() {
    final currencies = ["NGN", "RWF", "UGX", "KES", "ZAR", "USD", "GHS", "TZS"];
    return Container(
      height: 250,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      color: Colors.white,
      child: ListView(
        children: currencies
            .map((currency) => ListTile(
                  onTap: () => {_handleCurrencyTap(currency)},
                  title: Column(
                    children: [
                      Text(
                        currency,
                        textAlign: TextAlign.start,
                        style: const TextStyle(color: Colors.black),
                      ),
                      const SizedBox(height: 4),
                      const Divider(height: 1)
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }

  _handleCurrencyTap(String currency) {
    setState(() {
      selectedCurrency = currency;
      currencyController.text = currency;
    });
    Navigator.pop(context);
  }

  Future<void> showLoading(String message) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            margin: const EdgeInsets.fromLTRB(30, 20, 30, 20),
            width: double.infinity,
            height: 50,
            child: Text(message),
          ),
        );
      },
    );
  }
}
