import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class favourite extends StatelessWidget {
  const favourite({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Icon(
        Icons.favorite,
        size: 50,
        color: Colors.red,
      ),
    ));
  }
}
