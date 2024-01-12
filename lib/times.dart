import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class times extends StatefulWidget {
  const times();

  @override
  State<times> createState() => _timesState();
}

class _timesState extends State<times> {
  String timezone = '';
  fetchData() async {
    final response = await http.get(
        Uri.parse('http://worldtimeapi.org/api/timezone/Europe/Amsterdam'));

    Map data = jsonDecode(response.body);
    print(data['utc_datetime']);
    // setState(() {
    //   timezone = data['utc_datetime'];
    // });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 1000,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          ListTile(
            leading: Container(
              // margin: EdgeInsets.only(right: 300),
              child: Image(
                  height: 30,
                  image: NetworkImage(
                    'https://www.worldometers.info/img/flags/eg-flag.gif',
                  )),
            ),
            title: Text('kenea'),
          ),
          ListTile(
            leading: Container(
              // margin: EdgeInsets.only(right: 300),
              child: Image(
                  height: 30,
                  image: NetworkImage(
                    'https://www.worldometers.info/img/flags/es-flag.gif',
                  )),
            ),
            title: Text('kenea'),
          ),
          ListTile(
            leading: Container(
              // margin: EdgeInsets.only(right: 300),
              child: Image(
                  height: 30,
                  image: NetworkImage(
                    'https://www.worldometers.info/img/flags/small/tn_gm-flag.gif',
                  )),
            ),
            title: Text('kenea'),
          ),
          ListTile(
            leading: Container(
              // margin: EdgeInsets.only(right: 300),
              child: Image(
                  height: 30,
                  image: NetworkImage(
                    'https://www.worldometers.info/img/flags/kn-flag.gif',
                  )),
            ),
            title: Text('kenea'),
          ),
          ListTile(
            leading: Container(
              // margin: EdgeInsets.only(right: 300),
              child: Image(
                  height: 30,
                  image: NetworkImage(
                    'https://www.worldometers.info/img/flags/kn-flag.gif',
                  )),
            ),
            title: Text('kenea'),
          ),
          ListTile(
            leading: Container(
              // margin: EdgeInsets.only(right: 300),
              child: Image(
                  height: 30,
                  image: NetworkImage(
                    'https://www.worldometers.info/img/flags/kn-flag.gif',
                  )),
            ),
            title: Text('kenea'),
          ),
          // ListTile(
          //   title: Container(
          //     margin: EdgeInsets.only(right: 300),
          //     child: Image(
          //         height: 30,
          //         image: NetworkImage(
          //           'https://www.worldometers.info/img/flags/ec-flag.gif',
          //         )),
          //   ),
          // ),
          // ListTile(
          //   title: Container(
          //     margin: EdgeInsets.only(right: 300),
          //     child: Image(
          //         height: 30,
          //         image: NetworkImage(
          //           'https://www.worldometers.info/img/flags/eg-flag.gif',
          //         )),
          //   ),
          // ),
          // ListTile(
          //   title: Container(
          //     margin: EdgeInsets.only(right: 300),
          //     child: Image(
          //         height: 30,
          //         image: NetworkImage(
          //           'https://www.worldometers.info/img/flags/kn-flag.gif',
          //         )),
          //   ),
          // ),
          // ListTile(
          //   title: Container(
          //     margin: EdgeInsets.only(right: 300),
          //     child: Image(
          //         height: 30,
          //         image: NetworkImage(
          //           'https://www.worldometers.info/img/flags/do-flag.gif',
          //         )),
          //   ),
          // ),
          // ListTile(
          //   title: Container(
          //     margin: EdgeInsets.only(right: 300),
          //     child: Image(
          //         // fit: BoxFit.cover,
          //         height: 30,
          //         image: NetworkImage(
          //           'https://www.worldometers.info/img/flags/es-flag.gif',
          //         )),
          //   ),
          // ),
          // ListTile(
          //     leading: Container(
          //       margin: EdgeInsets.only(right: 300),
          //       child: Image(
          //           height: 30,
          //           image: NetworkImage(
          //             'https://www.worldometers.info/img/flags/kn-flag.gif',
          //           )),
          //     ),
          //     title: Text('kena')),
          // ListTile(
          //   title: Container(
          //     margin: EdgeInsets.only(right: 300),
          //     child: Image(
          //         height: 30,
          //         image: NetworkImage(
          //           'https://www.worldometers.info/img/flags/ec-flag.gif',
          //         )),
          //   ),
          // ),
          // ListTile(
          //   title: Container(
          //     margin: EdgeInsets.only(right: 300),
          //     child: Image(
          //         height: 30,
          //         image: NetworkImage(
          //           'https://www.worldometers.info/img/flags/eg-flag.gif',
          //         )),
          //   ),
          // ),
          // ListTile(
          //   title: Container(
          //     margin: EdgeInsets.only(right: 300),
          //     child: Image(
          //         height: 30,
          //         image: NetworkImage(
          //           'https://www.worldometers.info/img/flags/kn-flag.gif',
          //         )),
          //   ),
          // ),
          // ListTile(
          //   title: Container(
          //     margin: EdgeInsets.only(right: 300),
          //     child: Image(
          //         height: 30,
          //         image: NetworkImage(
          //           'https://www.worldometers.info/img/flags/do-flag.gif',
          //         )),
          //   ),
          // ),
          // ListTile(
          //   title: Container(
          //     margin: EdgeInsets.only(right: 300),
          //     child: Image(
          //         // fit: BoxFit.cover,
          //         height: 30,
          //         image: NetworkImage(
          //           'https://www.worldometers.info/img/flags/es-flag.gif',
          //         )),
          //   ),
          // ),
        ]),
      ),
    );
  }
}
