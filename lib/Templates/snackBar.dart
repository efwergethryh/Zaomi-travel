import 'package:flutter/material.dart';

class snackBar extends StatelessWidget {
  const snackBar();
  void showCustomSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        content: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(message),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}