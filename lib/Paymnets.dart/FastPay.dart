import 'package:fastpay_merchant/fastPayRequests.dart';
import 'package:fastpay_merchant/fastpay_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:fastpay_merchant/fastpay.dart';

class fastPay extends StatefulWidget {
  final int amount;
  const fastPay({super.key, required this.amount});

  @override
  State<fastPay> createState() => _fastPayState();
}

class _fastPayState extends State<fastPay> {
  @override
  void initState() {
    // TODO: implement initState
    FastPayRequest(
        storeID: '',
        storePassword: '',
        amount: "${widget.amount}",
        orderID: '',
        callbackUri: '');
        
  }

  Widget build(BuildContext context) {
    return FastPayCallback();
  }
}
