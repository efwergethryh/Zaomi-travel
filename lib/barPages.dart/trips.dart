import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class trips extends StatelessWidget {
  const trips({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        backgroundColor: Colors.blue,
        onPress: () => showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Add a trip'),
                    ]),
              );
            }),
        
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Image.asset(
              'assets/pics/airplane-animation.gif',
              width: 300,
            ),
            Text(
              "You don't have any trips yet",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
