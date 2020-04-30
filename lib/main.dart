import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:runningapp/provider/home_provider.dart';
import 'package:runningapp/provider/timer_provider.dart';
import 'package:runningapp/provider/user_provider.dart';
import 'package:runningapp/screens/intro_page.dart';


void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserProvider.initialize()),
        ChangeNotifierProvider.value(value: TimerProvider()),
        ChangeNotifierProvider.value(value: HomeProvider()),
      ],
      child: MyApp()));
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
    );
  }
}
