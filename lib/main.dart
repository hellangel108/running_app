import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:runningapp/provider/home_provider.dart';
import 'package:runningapp/provider/timer_provider.dart';
import 'package:runningapp/provider/user_provider.dart';
import 'package:runningapp/screens/home_page.dart';
import 'package:runningapp/screens/intro_page.dart';
import 'package:runningapp/screens/login_page.dart';
import 'package:runningapp/screens/main_page.dart';
import 'package:runningapp/screens/profile_page.dart';
//import 'package:runningapp/test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value: UserProvider.initialize()),
    ChangeNotifierProvider.value(value: TimerProvider()),
    ChangeNotifierProvider.value(value: HomeProvider()),
  ], child: MyApp()));
//  runApp(
//    MaterialApp(
//      home: MyApp(),
//    )
//  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/intro',
      routes: {
        '/intro':(context)=>IntroPage(),
        '/main':(context)=>MainPage(),
        '/login':(context)=>LoginPage(),
        '/profile': (context)=>ProfilePage(),
      },
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
    );
  }
}
