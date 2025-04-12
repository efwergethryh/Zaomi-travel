import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transportation_application/zoomOut.dart';

class profile extends StatelessWidget {
  const profile();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(physics: BouncingScrollPhysics(), slivers: [
      SliverAppBar(
        stretch: true,
        flexibleSpace: FlexibleSpaceBar(
          stretchModes: [StretchMode.zoomBackground],
          background: Image.asset(
            'assets/pics/background.png',
            fit: BoxFit.cover,
          ),
        ),
        expandedHeight: 250.0.h,
        floating: false,
        pinned: true,
      ),
      SliverToBoxAdapter(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Container(
              //   decoration: new BoxDecoration(
              //       gradient: new LinearGradient(colors: [
              //     const Color.fromARGB(255, 12, 81, 138),
              //     Color.fromARGB(255, 142, 173, 199)
              //   ])),
              //   width: double.maxFinite,
              //   height: 200,
              //   child: Column(
              //     children: [
              //       CircleAvatar(
              //         radius: 40,
              //         child: Icon(Icons.person),
              //       ),
              //       Text(
              //         'Login to see the latest sales from Zaomis',
              //         style: TextStyle(
              //             color: Colors.white, fontWeight: FontWeight.normal),
              //       ),
              //       Container(
              //           width: 100,
              //           child: TextButton(
              //               style: ButtonStyle(backgroundColor:
              //                   MaterialStateColor.resolveWith((states) {
              //                 return const Color.fromARGB(71, 0, 0, 0);
              //               })),
              //               onPressed: () {
              //                 Navigator.pushNamed(context, 'Login');
              //               },
              //               child: Text(
              //                 'Login',
              //                 style: TextStyle(
              //                     color: Colors.white,
              //                     fontWeight: FontWeight.bold),
              //               )))
              //     ],
              //   ),
              // ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, 'Login');
                },
                leading: Icon(Icons.login),
                title: Text('Login or create an account'),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.question_answer),
                title: Text('FAQ'),
              ),
              Container(
                margin: EdgeInsets.only(right: 250),
                child: Text(
                  'Help and support',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.question_mark_outlined),
                title: Text('Contact customer service'),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.health_and_safety_rounded),
                title: Text('Safety instructions'),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.handshake),
                title: Text('Objections discussions'),
              ),
              Container(
                margin: EdgeInsets.only(right: 310),
                child: Text(
                  'Explore',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.article),
                title: Text('Travelling articles'),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, 'splash-screen');
                },
                leading: Icon(Icons.local_taxi),
                title: Text('Airport Taxi'),
              ),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      )
    ]);
  }
}
