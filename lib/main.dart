import 'package:fastpay_merchant/fastpay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:transportation_application/Bookings/available.dart';
import 'package:transportation_application/Bookings/paymentScreen.dart';
import 'package:transportation_application/Categories/flight_rent.dart';
import 'package:transportation_application/Categories/insurance.dart';
import 'package:transportation_application/Home.dart';
import 'package:transportation_application/Paymnets.dart/FastPay.dart';
import 'package:transportation_application/Providers/insurance_passenger_provider.dart';
import 'package:transportation_application/Providers/passenger.dart';
import 'package:transportation_application/Providers/visa_provider.dart';
import 'package:transportation_application/Signup.dart';
import 'package:transportation_application/Templates/passengerTemplate.dart';
import 'package:transportation_application/Templates/searchbarTemplate.dart';
import 'package:transportation_application/Visa%20widgets/visa_form.dart';
import 'package:transportation_application/barPages.dart/Explore.dart';
import 'package:transportation_application/formWidgets/insurance_passengers.dart';
import 'package:transportation_application/formWidgets/passengers.dart';
import 'package:transportation_application/formWidgets/searchTo.dart';
import 'package:transportation_application/Providers/passenger_notifier.dart';
import 'package:transportation_application/splash_screen.dart';
import 'Login.dart';
import 'package:transportation_application/Templates/Arguments.dart';
import 'package:transportation_application/test/AdderModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AdderModel>(
        create: (_) => AdderModel(),
      ),
      // for (var i = 0; i < 3; i++)
      //   ChangeNotifierProvider<AdderModel>(
      //     create: (_) => AdderModel(),
      //   ),
      ChangeNotifierProvider<passenger>.value(value: passenger()),
      ChangeNotifierProvider<insurance_provider>.value(
          value: insurance_provider()),
      ChangeNotifierProvider<TextProvider>(
        create: (context) => TextProvider(),
        child: Home(),
      ),
      ChangeNotifierProvider<visa_provider>(
        create: (context) => visa_provider(),
      )
    ],  
    child: ScreenUtilInit(
      designSize: const Size(450, 790),
      child: MaterialApp(
        home: Splash_screen(),
        theme: new ThemeData(
          primaryColor: const Color.fromARGB(255, 140, 71, 71),
          // Add the line below to get horizontal sliding transitions for routes.
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          }),
        ),
        onGenerateRoute: (settings) {
          if (settings.arguments is Arguments) {
            final args = settings.arguments as Arguments;
            switch (settings.name) {
              case 'search':
                return MaterialPageRoute(
                  builder: (context) =>
                      searchBar(title: args.title, update: args.update),
                );
              
              default:
                return MaterialPageRoute(
                  builder: (context) => Container(
                    child: Text('Not found'),
                  ),
                );
            }
          }
        },
        routes: {
          'Signup': (context) => SignUp(),
          'Login': (context) => Login(),
          'flight': (context) => flight_rent(),
          'Home': (context) => Home(),
          'Explore': (context) => Explore(),
          'passengers': (context) => passengers(),
          'insurance_passengers': (context) => insurance_info(),
          'visa_form': (context) => visa_form(),
          'trips': (context) => trips(),
          'pay': (context) => PaymentScreen(),
          
          // 'splash-screen':(context)=>Splash_screen()
        },
      ),
    ),
  ));
}
