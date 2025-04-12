import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:transportation_application/Home.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({super.key});

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen>
    with SingleTickerProviderStateMixin {
  @override
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _animation;
  void initState() {
    super.initState();

    // Animation Controller
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3), // Animation duration
    );

    // Fade Animation (Opacity from 0 to 1)
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    // Scale Animation (Scaling from 0.5x to 1.2x)
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );
    _animation = Tween<Offset>(
      begin: Offset(0.0, 2.0), // Start position (off-screen bottom)
      end: Offset(0.0, 0.0), // End position (normal position)
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Start Animation
    _controller.forward();

    // Navigate to Home Screen after animation ends
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/pics/beach.jpeg'),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Stack(children: [
        Container(
            child: AnimatedSplashScreen(
          nextScreen: Home(),
          backgroundColor: Colors.transparent,
          duration: 4000,
          splashTransition: SplashTransition.slideTransition,
          splash: Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _animation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Image.asset(
                    'assets/pics/logo.png',
                    height: 500,
                    width: 200,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        )),
      ]),
    ));
  }


}
