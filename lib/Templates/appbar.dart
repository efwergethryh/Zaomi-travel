import 'package:flutter/material.dart';

class bar extends StatelessWidget {
  bar();

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: new Size(MediaQuery.of(context).size.width, 200.0),
      child: Container(
        decoration: new BoxDecoration(
            gradient: new LinearGradient(colors: [
          const Color.fromARGB(255, 12, 81, 138),
          Color.fromARGB(255, 142, 173, 199),
        ])),
        padding: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 20.0, left: 10),
          child: Text(
            '',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
