import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  late String pic;
  late String title;
  late String describtion;
  late String path;
  CategoryCard(
      {required this.pic,
      required this.title,
      required this.describtion,
      required this.path});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, path);
      },
      child: Card(
        child: Container(
          width: 300,
          height: 110,
          child: Row(children: [
            Image.asset(width: 100, pic),
            Container(
              margin: EdgeInsets.only(left: 60, top: 20),
              child: Column(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    describtion,
                    overflow: TextOverflow.clip,
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
