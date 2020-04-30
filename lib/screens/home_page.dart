
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:runningapp/provider/home_provider.dart';
import 'package:runningapp/provider/timer_provider.dart';
import 'package:runningapp/provider/user_provider.dart';
import 'package:runningapp/widgets/chart_view.dart';

import 'package:runningapp/widgets/count_view.dart';

import 'package:runningapp/widgets/google_map.dart';
import 'package:runningapp/widgets/home_menu.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
bool isStarting = false;
bool isPausing = false;
bool isStopping = true;

  @override
  Widget build(BuildContext context) {
    final time = Provider.of<TimerProvider>(context);
    final home = Provider.of<HomeProvider>(context);
    final user = Provider.of<UserProvider>(context);
    initState(){
      home.height = double.parse(user.userData.height);
      home.weight = double.parse(user.userData.weight);
    }
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
              _scaffoldKey.currentState.openDrawer();
            },
            child: Icon(Icons.menu, color: Colors.blueAccent,)),
        actions: <Widget>[IconButton(icon: Icon(Icons.notifications_none, color: Colors.black,), onPressed: (){})],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            MapView(),

            Container(
              height: 60,
              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: isStarting ? Colors.lightBlueAccent:Colors.transparent
                    ),
                    child: IconButton(
                      onPressed: (){
                        setState(() {
                          isPausing = !isPausing;
                        });
                        if(isPausing == true){
                          time.pauseStopwatch();
                          home.stopListeningStep();
                        }else {
                          time.startStopwatch();
                          home.startListeningStep();
                        }
                      },
                      icon: Icon(isPausing?Icons.play_arrow:Icons.pause,color: Colors.white,),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: isStopping?Colors.green:Colors.transparent
                      ),
                      child: IconButton(
                        onPressed: (){
                          setState(() {
                            isStarting = true;
                            isStopping = false;
                          });
                          if(isStarting==true) {
                            home.height = double.parse(user.userData.height);
                            home.weight = double.parse(user.userData.weight);
                            time.startStopwatch();
                            home.dispose();
                            home.getCurrentLocation(context: context, Case: 1);
                            home.startListeningStep();
                          }
                        },
                        icon: Icon(Icons.play_arrow,color: Colors.white,),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: isStarting ? Colors.red : Colors.transparent
                    ),
                    child: IconButton(
                      onPressed: (){
                        setState(() {
                          isStopping = true;
                          isStarting = false;
                        });
                        time.pauseStopwatch();
                        time.resetStopwatch();
                        home.stopListeningStep();
                        home.resetStep();
                        home.dispose();
                      },
                      icon: Icon(Icons.stop,color: Colors.white,),
                    ),
                  ),

                ],
              ),
            ),

            Container(
                child: CountView()),

            Padding(
              //thêm vô cho đẹp chưa xử lý
              padding: EdgeInsets.all(10),
              child: ChartView(),
            )
          ],
        ),
      ),
      drawer: HomeMenu(),
    );
  }
}
