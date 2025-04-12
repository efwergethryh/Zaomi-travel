import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class trip extends StatefulWidget {
  late String image;
  late String description;
  late String title;
  late String date;
  late int Price;
  trip(
      {required this.image,
      required this.description,
      required this.date,
      required this.title,
      required this.Price});

  @override
  State<trip> createState() => _tripState();
}

class _tripState extends State<trip> {
  final _isExpanded = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.transparent,
        child: CustomScrollView(physics: BouncingScrollPhysics(), slivers: [
          SliverAppBar(
            stretch: true,
            expandedHeight: 200.0.h,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: [StretchMode.zoomBackground],
              background: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black
                          .withOpacity(0.2), // Shadow color with opacity
                      spreadRadius: 2, // How much the shadow spreads
                      blurRadius: 10, // Blur effect
                      offset: Offset(0, 5), // Position of the shadow (X, Y)
                    ),
                  ],
                ),
                child: Image.network(
                  this.widget.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 600.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15.w),
                    child: Text(
                      this.widget.title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontFamily: AutofillHints.transactionAmount,
                        fontWeight: FontWeight.w800,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  GestureDetector(
                    onTap: () => {_isExpanded.value = !_isExpanded.value},
                    child: Container(
                      margin: EdgeInsets.only(left: 15.w),
                      child: Text(
                        'Details',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: AutofillHints.transactionAmount,
                          fontWeight: FontWeight.w800,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15.w),
                    child: Text(
                      maxLines: _isExpanded.value ? null : 10,
                      overflow:
                          _isExpanded.value ? null : TextOverflow.ellipsis,
                      this.widget.description,
                      style: TextStyle(
                        color: Color.fromRGBO(111, 111, 111, 1),
                        fontSize: 15,
                        fontFamily: AutofillHints.transactionAmount,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
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
                            'Book now',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, 'pay');
                          },
                        ),
                      )),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
