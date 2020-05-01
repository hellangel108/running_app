
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:runningapp/provider/user_provider.dart';

import 'package:runningapp/widgets/count_view.dart';

import 'package:runningapp/widgets/google_map.dart';
import 'package:runningapp/widgets/home_menu.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white70,
        elevation: 0.0,
        title: Text(
          "Running App",
          style: TextStyle(color: Colors.black),
        ),
        leading: FlatButton(
            onPressed: () {
              print("click menu");
              _scaffoldKey.currentState.openDrawer();
            },
            child: Icon(Icons.menu, color: Colors.blueAccent,)),
        actions: <Widget>[IconButton(icon: Icon(Icons.notifications_none, color: Colors.black,), onPressed: (){})],
      ),

      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Column(
         children: <Widget>[
           Stack(
             children: <Widget>[
               MapView(),

             ],
           ),

         Padding(
           padding: const EdgeInsets.all(8.0),
           child: CountView()
         )
         //Container(child: CountView())
         ],
        ),
      ),
      drawer: HomeMenu(),
    );
  }
}
