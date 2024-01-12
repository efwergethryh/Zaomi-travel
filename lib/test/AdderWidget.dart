import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AdderModel.dart';

class AdderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Consumer<AdderModel>(
          builder: (context, adder, child) {
            return Text(
              'Value: ${adder.value}',
              style: TextStyle(fontSize: 20),
            );
          },
        ),
        ElevatedButton(
          onPressed: () {
            Provider.of<AdderModel>(context, listen: false).increment();
          },
          child: Text('Increment'),
        ),
      ],
    );
  }
}
