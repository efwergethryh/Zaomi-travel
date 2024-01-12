import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'dart:io';

// import 'package:transportation_application/Templates/trip_temp.dart';
import 'package:transportation_application/Templates/triptemplate.dart';

class trips extends StatefulWidget {
  trips();

  @override
  State<trips> createState() => _tripsState();
}

class _tripsState extends State<trips> {
  Map<String, dynamic> fileList = Map();
  List<String> titles = [
    'Show all filters',
    'Cheap and fast',
    'Stops',
    'Price'
  ];
  List<tripTemplate> trips = [
    tripTemplate(
      date: '20/01/2019 - 20/01/2019',
      path: 'assets/Cities/IMG-20231215-WA0002.jpg',
      title: 'Dubai',
    ),
    tripTemplate(
      date: '20/01/2019 - 20/01/2019',
      path: 'assets/Cities/IMG-20231215-WA0003.jpg',
      title: 'Dubai',
    ),
    tripTemplate(
      date: '20/01/2019 - 20/01/2019',
      path: 'assets/Cities/IMG-20231215-WA0004.jpg',
      title: 'Dubai',
    ),
    tripTemplate(
      date: '20/01/2019 - 20/01/2019',
      path: 'assets/Cities/IMG-20231215-WA0005.jpg',
      title: 'Dubai',
    ),
    tripTemplate(
      date: '20/01/2019 - 20/01/2019',
      path: 'assets/Cities/IMG-20231215-WA0006.jpg',
      title: 'Dubai',
    ),
    tripTemplate(
      date: '20/01/2019 - 20/01/2019',
      path: 'assets/Cities/IMG-20231215-WA0007.jpg',
      title: 'Dubai',
    ),
    tripTemplate(
      date: '20/01/2019 - 20/01/2019',
      path: 'assets/Cities/IMG-20231215-WA0008.jpg',
      title: 'Dubai',
    ),
    tripTemplate(
      date: '20/01/2019 - 20/01/2019',
      path: 'assets/Cities/IMG-20231215-WA0009.jpg',
      title: 'Dubai',
    ),
    tripTemplate(
      date: '20/01/2019 - 20/01/2019',
      path: 'assets/Cities/IMG-20231215-WA0014.jpg',
      title: 'Turkey',
    ),
    tripTemplate(
      date: '20/01/2019 - 20/01/2019',
      path: 'assets/Cities/IMG-20231215-WA0002.jpg',
      title: 'Dubai',
    ),
    tripTemplate(
      date: '20/01/2019 - 20/01/2019',
      path: 'assets/Cities/IMG-20231215-WA0003.jpg',
      title: 'Dubai',
    ),
    tripTemplate(
      date: '20/01/2019 - 20/01/2019',
      path: 'assets/Cities/IMG-20231215-WA0004.jpg',
      title: 'Dubai',
    ),
    tripTemplate(
      date: '20/01/2019 - 20/01/2019',
      path: 'assets/Cities/IMG-20231215-WA0005.jpg',
      title: 'Dubai',
    ),
    tripTemplate(
      date: '20/01/2019 - 20/01/2019',
      path: 'assets/Cities/IMG-20231215-WA0006.jpg',
      title: 'Dubai',
    ),
    tripTemplate(
      date: '20/01/2019 - 20/01/2019',
      path: 'assets/Cities/IMG-20231215-WA0007.jpg',
      title: 'Dubai',
    ),
    tripTemplate(
      date: '20/01/2019 - 20/01/2019',
      path: 'assets/Cities/IMG-20231215-WA0008.jpg',
      title: 'Dubai',
    ),
    tripTemplate(
      date: '20/01/2019 - 20/01/2019',
      path: 'assets/Cities/IMG-20231215-WA0009.jpg',
      title: 'Dubai',
    ),
    tripTemplate(
      date: '20/01/2019 - 20/01/2019',
      path: 'assets/Cities/IMG-20231215-WA0014.jpg',
      title: 'Turkey',
    )
  ];
  final Map<String, dynamic> manifestMap = Map();
  void writePathsToJsonFile() async {
    try {
      // Get the app's documents directory
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;

      // Specify the folder you want to read paths from
      Directory folder = Directory('$appDocPath/assets/Cities');

      // List all files in the folder
      List<FileSystemEntity> files = folder.listSync();

      // Extract file paths from the list of files
      List<String> filePaths =
          files.where((file) => file is File).map((file) => file.path).toList();

      // Create a JSON map with the file paths
      Map<String, dynamic> jsonData = {'imagePaths': filePaths};

      // Convert the data to a JSON string
      String jsonString = json.encode(jsonData);

      // Specify the file path
      String filePath = '$appDocPath/assets/Cities/cities_manifest.json';

      // Open the file for writing
      File file = File(filePath);
      file.writeAsStringSync(jsonString);

      print('File paths written to $filePath');
    } catch (e) {
      print('Error writing to file: $e');
    }
  }

  Future<void> _loadFiles() async {
    var assetsFile = await DefaultAssetBundle.of(context)
        .loadString('assets/Cities/cities_manifest.json');
    fileList = json.decode(assetsFile);
  }

  @override
  void initState() {
    super.initState();
    writePathsToJsonFile();
  }

  @override
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
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    titles.length, (index) => tabb(title: titles[index])),
              ),
            ),
            SizedBox(
              height: 10,
            ),
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
            SizedBox(
              height: 10, 
            ),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: trips
                    .map((e) => tripTemplate(
                          path: e.path,
                          date: e.date,
                          title: e.title,
                        ))
                    .toList(),
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
