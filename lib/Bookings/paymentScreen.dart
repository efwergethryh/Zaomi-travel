import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transportation_application/Paymnets.dart/FastPay.dart';
import 'package:transportation_application/Templates/barTemplate.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int _selectedMethod = 0; // 0=Credit Card, 1=PayPal, 2=Apple Pay
  final _formKey = GlobalKey<FormState>();
  final _cardController = TextEditingController();
  final _expiryController = TextEditingController();
  final _cvvController = TextEditingController();

  @override
  void dispose() {
    _cardController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: new Size(MediaQuery.of(context).size.width, 200.0),
          child: barTemplate(title: 'Choose payment method')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Payment Method Selection
            _buildPaymentMethodCard(
              logo: 'assets/pics/FIB-logo.png',
              title: "Pay with FIB",
              isSelected: _selectedMethod == 0,
              onTap: () => setState(() => _selectedMethod = 0),
            ),
            SizedBox(height: 15),
            _buildPaymentMethodCard(
              logo: 'assets/pics/fast-pay-logo.png',
              title: "Fast Pay",
              isSelected: _selectedMethod == 1,
              onTap: () => setState(() => _selectedMethod = 1),
            ),
            SizedBox(height: 15),
            _buildPaymentMethodCard(
              logo: 'assets/pics/Zain-Cash-logo.png',
              title: "Zain cash",
              isSelected: _selectedMethod == 2,
              onTap: () => setState(() => _selectedMethod = 2),
            ),
            SizedBox(height: 30),

            // Dynamic Form Based on Selection
            if (_selectedMethod == 0) _buildCreditCardForm(),
            if (_selectedMethod == 1) _buildPayPalInfo(),
            if (_selectedMethod == 2) _buildApplePayInfo(),

            Spacer(),
            Container(
                width: 420.w,
                height: 60,
                margin: EdgeInsets.only(left: 2.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color.fromARGB(240, 223, 227, 236),
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 2.w),
                  decoration: BoxDecoration(
                      gradient: new LinearGradient(colors: [
                    const Color.fromARGB(255, 12, 81, 138),
                    Color.fromARGB(255, 142, 173, 199)
                  ])),
                  child: TextButton(
                    child: Text(
                      'PAY \$29',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      _processPayment(context);
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodCard({
    required String logo,
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isSelected ? Colors.blue : Colors.grey.shade300,
          width: isSelected ? 2 : 1,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Image.asset(logo, scale: 10.w),
              SizedBox(width: 20),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? Colors.blue : Colors.black,
                ),
              ),
              Spacer(),
              if (isSelected) Icon(Icons.check_circle, color: Colors.blue),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCreditCardForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _cardController,
            decoration: InputDecoration(
              labelText: 'Card Number',
              prefixIcon: Icon(Icons.credit_card),
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(16),
              CardNumberFormatter(),
            ],
            validator: (value) {
              if (value == null || value.isEmpty)
                return 'Please enter card number';
              if (value.length != 19) return 'Invalid card number';
              return null;
            },
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _expiryController,
                  decoration: InputDecoration(
                    labelText: 'MM/YY',
                    prefixIcon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(4),
                    CardExpiryFormatter(),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Enter expiry date';
                    if (value.length != 5) return 'Invalid date';
                    return null;
                  },
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: TextFormField(
                  controller: _cvvController,
                  decoration: InputDecoration(
                    labelText: 'CVV',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(3),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Enter CVV';
                    if (value.length != 3) return 'Invalid CVV';
                    return null;
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPayPalInfo() {
    return Column(
      children: [
        SizedBox(height: 20),
        Text(
          'Pay securely with Fast Pay',
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildApplePayInfo() {
    return Column(
      children: [
        SizedBox(height: 20),
        Text(
          'Pay securely with Zain Cash',
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  void _processPayment(BuildContext context) {
    if (_selectedMethod == 0) {
      if (!_formKey.currentState!.validate()) return;
      // Process credit card payment
      _showPaymentSuccess('Credit Card', context);
    } else if (_selectedMethod == 1) {
      // Process PayPal payment
      _showPaymentSuccess('FastPay', context);
    } else {
      // Process Apple Pay
      _showPaymentSuccess('ZainCash', context);
    }
  }

  void _showPaymentSuccess(String method, BuildContext context) {
    switch (method) {
      case 'FastPay':
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => fastPay(amount: 20),
            ));
    }
  }
}

// Custom formatters for card input
class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var text = newValue.text;
    if (newValue.selection.baseOffset == 0) return newValue;

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write(' '); // Add space after every 4 characters
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}

class CardExpiryFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var text = newValue.text;
    if (newValue.selection.baseOffset == 0) return newValue;

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != text.length) {
        buffer.write('/'); // Add slash after MM
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}
