import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:the_jewel/ui/splashscreen.dart';

//this just for preview design on different screen sizes
/*void main() => runApp(
      DevicePreview(
        builder: (context) => EasyLocalization(
            supportedLocales: [Locale('en'), Locale('ar')],
            path: 'assets/resources/strings', // <-- change patch to your
            child: MyApp()),
      ), // Wrap your app
    );*/

void main() => runApp(
      EasyLocalization(
          supportedLocales: [Locale('en'), Locale('ar')],
          path: 'assets/resources/strings', // <-- change patch to your
          child: MyApp()),
    );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      //return LayoutBuilder
      builder: (context, constraints) {
        return OrientationBuilder(
          //return OrientationBuilder
          builder: (context, orientation) {
            //initialize SizerUtil()
            SizerUtil().init(constraints, orientation); //initialize SizerUtil
            var lang = context.locale.toString(); // get lang of app
            // print('your app language is:$lang');
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              //locale: DevicePreview.locale(context), // for device preview
              //builder: DevicePreview.appBuilder, // for device preview
              locale: context.locale,

              theme: ThemeData(
                fontFamily: lang == 'ar' ? 'Ajannat' : 'Roboto',
              ),
              home: StartScreen(),
            );
          },
        );
      },
    );
  }
}
