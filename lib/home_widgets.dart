export 'package:the_jewel/ui/home/components/categories.dart';

/*
when i create a dart file inside folders in the lib the class that have been
created will be considered as private so i must create a file in the main lib folder
and export all dart files and then in any other class i can just import the main class
that have been exported
example:
- u can place all your widgets in a folder, for example libs/src/ and then create file custom_widgets.dart in libs/ and use export like this inside custom_widgets.dart:
export 'src/custom_multiplechoice.dart';
export 'src/custom_singlechoice.dart';
export 'src/custom_time.dart';
export 'src/custom_widgets/src/custom_yesnochoice.dart';
export 'src/custom_date.dart';

Once you import custom_widgets.dart, all those widgets will be available to you.
ref: https://stackoverflow.com/questions/55579092/how-to-avoid-writing-an-import-for-every-single-file-in-dart-flutter
*/
