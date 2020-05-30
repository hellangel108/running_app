import 'package:flutter/material.dart';
import 'package:runningapp/screens/home_page.dart';
import 'package:runningapp/screens/setting_page.dart';
import 'package:runningapp/screens/target_page.dart';
import 'package:runningapp/widgets/BottomNavigationBar/bootom_navigation_bar.dart';
import 'package:runningapp/widgets/home_menu.dart';
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isHomePageSelected = true;
  bool isTargetPageSelected = false;
  bool isSettingPageSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                 Colors.lightBlue
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
          child: Stack(
            children: <Widget>[
              //------------Điều hướng màn hình-----------------
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: isHomePageSelected ? HomePage() : (isTargetPageSelected ? TargetPage() : SettingPage()),
              ),

              //-----App Bar----------------------
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black54,
                        Colors.lightBlue
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )),
                child: AppBar(
                  centerTitle: true,
                  backgroundColor: Colors.black54,
                  elevation: 5.0,
                  title: Text(
                    "Running App",
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: FlatButton(
                      onPressed: () {
                        _scaffoldKey.currentState.openDrawer();
                      },
                      child: Icon(
                        Icons.menu,
                        color: Colors.white,
                      )),
                  actions: <Widget>[
                    IconButton(
                        icon: Icon(
                          Icons.notifications_none,
                          color: Colors.white,
                        ),
                        onPressed: () {})
                  ],
                )
              )
            ],
          ),
        ),
      ),
      //-----------------Bottom Bar--------------------
      bottomNavigationBar: CustomBottomNavigationBar(onIconPresedCallback: onBottomIconPressed),
      //----------------Drawer View--------------------
      drawer: HomeMenu(),
    );
  }

  void onBottomIconPressed(int index) {
    switch(index){
      case 0:
        setState(() {
          isHomePageSelected = false;
          isTargetPageSelected = true;
          isSettingPageSelected = false;
        });
        break;
      case 1:
        setState(() {
          isHomePageSelected = true;
          isTargetPageSelected = false;
          isSettingPageSelected = false;
        });
        break;
      case 2:
       setState(() {
         isHomePageSelected = false;
         isTargetPageSelected = false;
         isSettingPageSelected = true;
       });
        break;
    }
  }
}
