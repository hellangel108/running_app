import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:runningapp/models/user.dart';
import 'package:runningapp/provider/user_provider.dart';
import 'package:runningapp/screens/intro_page.dart';
import 'package:runningapp/screens/profile_page.dart';

class HomeMenu extends StatefulWidget {
  @override
  _HomeMenuState createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Drawer(
      child: ListView(
        children: <Widget>[
          //Header
          UserAccountsDrawerHeader(
            accountName: Text(user.userData.name, style: TextStyle(color: Colors.black),),
            accountEmail: Text(user.userData.email),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.person,color: Colors.white,),
              ),
            ),
          ),

          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
            },
            child: ListTile(
              leading: Icon(Icons.person, color: Colors.blue,),
              title: Text(
                "My Profile",
                style: TextStyle(fontSize: 18, color: Color(0xff323643)),
              ),
            ),
          ),
          InkWell(
            onTap: (){
            },
            child: ListTile(
              leading: Icon(Icons.help, color: Colors.blue,),
              title: Text(
                "Help & Supports",
                style: TextStyle(fontSize: 18, color: Color(0xff323643)),
              ),
            ),
          ),
          InkWell(
            onTap: (){
              user.signOut();
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.blue,),
              title: Text(
                "Logout",
                style: TextStyle(fontSize: 18, color: Color(0xff323643)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
