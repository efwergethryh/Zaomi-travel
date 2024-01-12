import 'package:flutter/material.dart';
import 'MyCustomClipper.dart';

class CurvedContainer extends StatefulWidget {
  late String title;
  CurvedContainer({required this.title});

  @override
  State<CurvedContainer> createState() => _CurvedContainerState();
}

class _CurvedContainerState extends State<CurvedContainer> {
  @override
  void initState() {
    // TODO: implement initState
    // print(title);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //stack overlaps widgets
        Opacity(
          //semi red clippath with more height and with 0.5 opacity
          opacity: 0.5,
          child: ClipPath(
            clipper: MyCustomClipper(), //set our custom wave clipper
            child: Container(
              color: const Color.fromARGB(255, 64, 140, 255),
              height: 160,
            ),
          ),
        ),

        ClipPath(
          //upper clippath with less height
          clipper: MyCustomClipper(), //set our custom wave clipper.
          child: Container(
              padding: EdgeInsets.only(bottom: 50),
              color: Color.fromARGB(88, 64, 140, 255),
              height: 140,
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(left: 30),
                child: Container(
                  margin: EdgeInsets.only(right: 250),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              )),
        ),
      ],
    );
    // Stack(
    //   children:
    //   ClipPath(
    //       clipper: MyCustomClipper(),
    //       child: Container(
    //         width: width,
    //         height: height,
    //           color: Colors.blue,
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: <Widget>[
    //               Text('text'),
    //             ],
    //           ))),
    // );
  }
}
