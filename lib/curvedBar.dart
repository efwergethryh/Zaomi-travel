import 'package:flutter/material.dart';
// import 'package:proste_bezier_curve/proste_bezier_curve.dart';

class curvedBar extends StatelessWidget {
  curvedBar();
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            child: Column(children: [
      // ClipPath(
      //   clipper: ProsteThirdOrderBezierCurve(
      //     position: ClipPosition.bottom,
      //     list: [
      //       ThirdOrderBezierCurveSection(
      //         p1: Offset(0, 100),
      //         p2: Offset(0, 210),
      //         p3: Offset(MediaQuery.of(context).size.width, 100),
      //         p4: Offset(MediaQuery.of(context).size.width, 200),
      //       ),
      //     ],
      //   ),
      //   child: Container(
      //     color: Color.fromARGB(255, 52, 84, 109),

      //     height: 10,
      //     child: Column(children: [
      //       // const SizedBox(),
      //       // Padding(
      //       //   padding: const EdgeInsets.all(8.0),
      //       //   child: TextField(
      //       //     controller: _searchController,
      //       //     decoration: InputDecoration(
      //       //       labelText: 'from',
      //       //       hintText: 'choose location',
      //       //       prefixIcon: Icon(Icons.search),
      //       //       border: OutlineInputBorder(
      //       //         borderRadius: BorderRadius.circular(20.0),
      //       //       ),
      //       //     ),
      //       //     onChanged: (value) {
      //       //       print('Search term: $value');
      //       //     },
      //       //   ),
      //       // )
      //     ]),
      //   ),
      // ),
    ])));
  }
}
