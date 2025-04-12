import 'package:flutter/material.dart';

class ZoomOutImage extends StatefulWidget {
  const ZoomOutImage({super.key});

  @override
  State<ZoomOutImage> createState() => _ZoomOutImageState();
}

class _ZoomOutImageState extends State<ZoomOutImage> {
  double scaleFactor = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        // Calculate the scale factor based on the vertical drag
        double newScaleFactor = scaleFactor - details.primaryDelta! / 300.0;
        if (newScaleFactor < 0.5) {
          newScaleFactor = 0.5;
        }

        // Update the scale factor and trigger a rebuild
        setState(() {
          scaleFactor = newScaleFactor;
        });
      },
      child: Transform.scale(
        scale: scaleFactor,
        child: Image.asset(
          'assets/pics/background2.jpg', // Replace with your image URL
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
