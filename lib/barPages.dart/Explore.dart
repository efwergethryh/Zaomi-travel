import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transportation_application/Categories/car_rent.dart';
import 'package:transportation_application/Categories/flight_rent.dart';
import 'package:transportation_application/Categories/hotel_rent.dart';
import 'package:transportation_application/Categories/insurance.dart';
import 'package:transportation_application/Templates/Tab.dart';
import 'package:transportation_application/Templates/categoryCard.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:transportation_application/Categories/visa_initial.dart';
import 'package:transportation_application/my_flutter_app_icons.dart';
import 'package:transportation_application/zoomOut.dart';

class Explore extends StatefulWidget {
  const Explore();

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 6, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          stretch: true,
          expandedHeight: 600.0.h,
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: [StretchMode.zoomBackground],
            background: Image.asset(
              'assets/pics/Zaomi.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
            )),
            height: 700,
            child: Column(
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  height: 600,
                  child: Scaffold(
                    appBar: TabBar(
                      isScrollable: true,
                      controller: _tabController,
                      labelColor: Colors.black,
                      unselectedLabelStyle:
                          MaterialStateTextStyle.resolveWith((states) {
                        return TextStyle(color: Colors.black);
                      }),
                      tabs: [
                        Tab(text: 'Flight', icon: Icon(Icons.flight)),
                        Tab(text: 'Rent an hotel', icon: Icon(Icons.bed)),
                        Tab(text: 'Rent a car', icon: Icon(Icons.local_taxi)),
                        Tab(
                            text: 'Insurance',
                            icon: Icon(Icons.health_and_safety)),
                        Tab(text: 'VISA'),
                        Tab(text: 'Attractions', icon: Icon(Icons.explore)),
                      ],
                      dividerColor: Colors.black,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BubbleTabIndicator(
                        indicatorHeight: 55,
                        indicatorColor: Colors.blueAccent,
                        tabBarIndicatorSize: TabBarIndicatorSize.tab,
                      ),
                    ),
                    body: TabBarView(
                      controller: _tabController,
                      children: [
                        flight_rent(),
                        hotel_rent(),
                        car_rent(),
                        insurance(),
                        visa_initial(),
                        Container()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
