import 'package:flutter/material.dart';

class barTemplate extends StatelessWidget {
  late String title;
  barTemplate({required this.title});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: new BoxDecoration(
          gradient: new LinearGradient(colors: [
        const Color.fromARGB(255, 12, 81, 138),
        Color.fromARGB(255, 142, 173, 199)
      ])),
      padding: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 20.0, left: 10),
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
