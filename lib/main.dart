import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:the_jewel/ui/cart/cart.dart';
import 'package:the_jewel/ui/countryselect/selectcountry.dart';
import 'package:the_jewel/ui/home/components/mostsales.dart';
import 'package:the_jewel/ui/home/components/mostvisited.dart';
import 'package:the_jewel/ui/home/home.dart';
import 'package:the_jewel/ui/languageselect/languagescreen.dart';
import 'package:the_jewel/ui/navigation.dart';
import 'package:the_jewel/ui/notifications.dart';
import 'package:the_jewel/ui/offers.dart';
import 'package:the_jewel/ui/privacypolicy/privacypolicy.dart';
import 'package:the_jewel/ui/profile.dart';
import 'package:the_jewel/ui/register.dart';
import 'package:the_jewel/ui/signin/signin.dart';
import 'package:the_jewel/ui/splashscreen.dart';

import 'home_widgets.dart';

//this just for preview design on different screen sizes
/*void main() => runApp(
      DevicePreview(
        builder: (context) => EasyLocalization(
            supportedLocales: [Locale('en'), Locale('ar')],
            path: 'assets/resources/strings', // <-- change patch to your
            child: MyApp()),
      ), // Wrap your app
    );*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/resources/strings', // <-- change patch to your
        fallbackLocale: Locale(
            'en', 'US'), // when call back failed return the english lanuage
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          initialRoute: StartScreen.id,
          // the initial route for the app
          theme: ThemeData(
            fontFamily: context.locale.toString() == 'ar'
                ? 'Ajannat'
                : 'Roboto', // select font based on country
          ),
          routes: {
            StartScreen.id: (context) =>
                StartScreen(), // creating the routes of the page
            LanguageScreen.id: (context) => LanguageScreen(),
            Cart.id: (context) => Cart(),
            Home.id: (context) => Home(),
            NavigationBar.id: (context) => NavigationBar(),
            Notifications.id: (context) => Notifications(),
            Offers.id: (context) => Offers(),
            PrivacyPolicy.id: (context) => PrivacyPolicy(),
            Profile.id: (context) => PrivacyPolicy(),
            RegisterActivity.id: (context) => RegisterActivity(),
            SelectCountry.id: (context) => SelectCountry(),
            SignIn.id: (context) => SignIn(),
            Offers.id: (context) => Offers(),
            MostSales.id: (context) => MostSales(),
            MostVisited.id: (context) => MostVisited(),
            Categories.id: (context) => Categories(),
          }, // routes
        );
      },
    );
  }
}
// var lang=context.locale.toString();
