import 'package:flutter/material.dart';
class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black54,
              Colors.blue,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,

          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Card(
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  size: 40,
                  color: Colors.blueAccent,
                ),
                title: Text(
                  "Setting",
                  style: TextStyle(
                      fontSize: 18, color: Colors.blueAccent),
                ),
                subtitle: Text(
                  "",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              )
          ),
        ],
      ),
    );
  }
}
