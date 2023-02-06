import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/pref/shared_pref_controller.dart';
import 'package:untitled/provider/language_provider.dart';
import 'package:untitled/screens/home_screen.dart';
import 'package:untitled/screens/launch_screen.dart';
import 'package:untitled/screens/login_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initpref();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
       providers: [
         ChangeNotifierProvider<LanguageProvider>(create: (context)=> LanguageProvider()),
       ],
      child: MyMaterialApp() ,
    );
  }
}
class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      // supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates:  [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,

      ],
      supportedLocales:  [
        Locale('ar'),
        Locale('en'),
      ],
      locale:  Locale(Provider.of<LanguageProvider>(context).language),
      debugShowCheckedModeBanner: false,
      initialRoute:'/launch_screen' ,
      routes: {
        '/launch_screen':(context)=>const LaunchScreen(),
        '/login_screen':(context)=>const LoginScreen(),
        '/home_screen':(context)=>const HomeScreen()
      },
    );
  }
}



