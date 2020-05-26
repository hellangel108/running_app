import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:runningapp/provider/home_provider.dart';
import 'package:runningapp/provider/timer_provider.dart';
import 'package:runningapp/provider/user_provider.dart';
import 'package:runningapp/widgets/BottomNavigationBar/bootom_navigation_bar.dart';
import 'package:runningapp/widgets/chart_view.dart';

import 'package:runningapp/widgets/count_view.dart';

import 'package:runningapp/widgets/google_map.dart';
import 'package:runningapp/widgets/home_menu.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isStarting = false;
  bool isPausing = false;
  bool isStopping = true;
  bool isHomePageSelected = true;
  bool isProfilePageSelected = false;
  @override
  Widget build(BuildContext context) {
    final time = Provider.of<TimerProvider>(context);
    final home = Provider.of<HomeProvider>(context);
    final user = Provider.of<UserProvider>(context);



    initState() {
      home.height = double.parse(user.userData.height);
      home.weight = double.parse(user.userData.weight);
    }

    return Column(
      children: <Widget>[
        MapView(),

        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black54,
                  Colors.blueGrey,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,

              )),
          child: Column(
            children: <Widget>[
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
                          color: isStarting
                              ? Colors.lightBlueAccent
                              : Colors.transparent),
                      child: IconButton(
                        onPressed: isStarting ? () {
                          setState(() {
                            isPausing = !isPausing;
                          });
                          if (isPausing == true) {
                            time.pauseStopwatch();
                            home.stopListeningStep();
                          } else {
                            time.startStopwatch();
                            home.startListeningStep();
                          }
                        } : null,
                        icon: Icon(
                          isPausing ? Icons.play_arrow : Icons.pause,
                          color: isStarting ? Colors.white : Colors.transparent,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color:
                            isStopping ? Colors.green : Colors.transparent),
                        child: IconButton(
                          onPressed: isStarting ? null : () {
                            setState(() {
                              isStarting = true;
                              isStopping = false;
                            });
                            if (isStarting == true) {
                              home.height = double.parse(user.userData.height);
                              home.weight = double.parse(user.userData.weight);
                              time.startStopwatch();
                              home.dispose();
                              home.getCurrentLocation(context: context, Case: 1);
                              home.startListeningStep();
                            }
                          },
                          icon: Icon(
                            Icons.play_arrow,
                            color: isStarting ? Colors.transparent : Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: isStarting ? Colors.red : Colors.transparent),
                      child: IconButton(
                        onPressed: isStarting ? () {
                          setState(() {
                            isStopping = true;
                            isStarting = false;
                          });
                          time.pauseStopwatch();
                          time.resetStopwatch();
                          home.stopListeningStep();
                          home.resetStep();
                          home.dispose();
                        } : null,
                        icon: Icon(
                          Icons.stop,
                          color: isStarting ? Colors.white : Colors.transparent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(child: CountView()),
//              Padding(
//                //thêm vô cho đẹp chưa xử lý
//                padding: EdgeInsets.all(10),
//                child: ChartView(),
//              )
            ],
          ),
        ),

      ],
    );


  }
  void onBottomIconPressed(int index) {
    switch(index){
      case 0:
        setState(() {
          isHomePageSelected = false;
          isProfilePageSelected = true;
        });
        break;
      case 1:
        setState(() {
          isHomePageSelected = true;
          isProfilePageSelected = false;
        });
        break;
      case 2:
        break;
    }
  }

}
