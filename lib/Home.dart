import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transportation_application/barPages.dart/Explore.dart';
import 'package:transportation_application/barPages.dart/Profile.dart';
import 'package:transportation_application/barPages.dart/favourite.dart';
import 'package:transportation_application/barPages.dart/trips.dart';
// import 'package:transportation_application/curvedcontainer.dart';
// import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
import 'package:transportation_application/my_flutter_app_icons.dart';
import 'package:transportation_application/times.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  // @override
  late AnimationController animationController;
  late PageController _pageController;
  int selectedIndex = 1;
  late String currentTitle;
  @override
  void initState() {
    animationController = AnimationController(
    vsync: this, duration: const Duration(milliseconds: 1200));
    super.initState();
    currentTitle = 'Explore';
    _pageController = PageController(initialPage: selectedIndex);
  }

  void changePage(int index) {
    selectedIndex = index;
    switch (selectedIndex) {
      case 0:
        setState(() {
          currentTitle = 'My Account';
        });
        break;

      case 1:
        setState(() {
          currentTitle = 'Explore';
        });
        break;
      default:
    }

    _pageController.animateToPage(selectedIndex,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOutQuad);
    print(currentTitle);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // appBar: ,
        floatingActionButton: FloatingActionButton(
            child: Icon(
              MyFlutterApp.globe,
              size: ScreenUtil().setWidth(50),
            ),
            onPressed: () {
              showModalBottomSheet(
                  // transitionAnimationController: animationController,/
                  context: context,
                  enableDrag: true,
                  // showDragHandle: true,
                  builder: (BuildContext context) {
                    return times();
                  });
            }),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 5.0,
          child: SizedBox(
            height: kBottomNavigationBarHeight,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: const Color.fromARGB(255, 12, 81, 138),
              currentIndex: selectedIndex,

              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.black,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                  _pageController.jumpToPage(index);
                  changePage(selectedIndex);
                });
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.travel_explore_sharp),
                  label: '',
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: PageView(
            children: _pages,
            controller: _pageController,
          ),
        ));
  }
}

final List<Widget> _pages = [
  profile(),
  
  Explore(),
];
