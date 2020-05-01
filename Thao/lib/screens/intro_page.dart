import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:runningapp/screens/login_page.dart';
import 'package:runningapp/screens/register_page.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset("assets/images/background.jpg",fit: BoxFit.fill,),
          ),
          Container(
            alignment: Alignment.center,
            color: Colors.white.withOpacity(0.4),
            padding: EdgeInsets.fromLTRB(30, 200, 30, 0),
            child: ListView(

              children: <Widget>[
                Container(
                  height: 80.0,
                  width: 80.0,
                  child: new CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 100.0,
                    child: Image.asset("assets/images/icon.png",fit: BoxFit.fill,),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                  child: Center(child: Text("RUN APP", style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold, inherit: false),)),
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 52,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                    },
                    child: Text(
                      "Log In",
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 52,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
