import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:transportation_application/Templates/triptemplate.dart';
import 'package:transportation_application/requests/request.dart';

class trips extends StatefulWidget {
  trips();

  @override
  State<trips> createState() => _tripsState();
}

class _tripsState extends State<trips> {
  // API Configuration
  static const String baseUrl = 'http://192.168.0.191:7298';

  Map<String, dynamic> fileList = Map();
  List<String> titles = [
    'Show all filters',
    'Cheap and fast',
    'Stops',
    'Price'
  ];
  List<tripTemplate> trips = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    getTrips();
  }

  Future<void> getTrips() async {
    try {
      setState(() {
        isLoading = true;
        errorMessage = null;
      });

      request req = request();
      final response = await req.getRequest(
          '$baseUrl/api/v1/flights/search?origin=JFK&destination=LAX&departureDate=2025-04-1');
          if (response != null) {
          var rawData = response['data'];
          List dataList = [];

          if (rawData is List) {
            dataList = rawData;
          } else if (rawData is Map && rawData.containsKey('\$values')) {
            dataList = rawData['\$values'];
          }
          setState(() {
          trips = dataList
          .map((item) => tripTemplate(
                title: item['name'] ?? '',
                path: item['Image'] ?? '',
                description: item['Description'] ?? '',
                Price: item['Price'] ?? '',
                date: item['ArrivalTime'] ?? '',
              ))
        .toList();
    isLoading = false;
  });

       
      }
    } catch (error) {
      setState(() {
        if (error is SocketException) {
          errorMessage =
              'Could not connect to the server. Please check if the server is running.';
        } else {
          errorMessage = 'Error loading trips: $error';
        }
        isLoading = false;
      });
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(30, 60),
        child: Container(
          width: 360,
          height: 300,
          decoration: BoxDecoration(color: Color(0xFF3D5177)),
          child: Row(
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Baghdad -> New York\n',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '20/01/2019 - 20/01/2019 , 1 passenger',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_forward),
                  color: Colors.white),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    titles.length, (index) => tabb(title: titles[index])),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Available trips',
              style: TextStyle(
                color: Color(0xFF401D8A),
                fontSize: 16,
                fontFamily: 'Karma',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            SizedBox(height: 10),
            if (isLoading)
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 10),
                    Text('Loading trips...',
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
              )
            else if (errorMessage != null)
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(errorMessage!),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: getTrips,
                      child: Text('Retry'),
                    ),
                  ],
                ),
              )
            else if (trips.isEmpty)
              Center(
                child: Text('No trips available'),
              )
            else
              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: trips,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class tabb extends StatelessWidget {
  String title;
  tabb({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 10),
        Container(
          height: 17,
          decoration: ShapeDecoration(
            color: Color(0xFFD9D9D9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: Color(0xFF4F558E),
              fontSize: 17.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        ),
      ],
    );
  }
}
