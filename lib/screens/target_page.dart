import 'package:flutter/material.dart';
import 'package:runningapp/widgets/count_view.dart';
class TargetPage extends StatefulWidget {
  @override
  _TargetPageState createState() => _TargetPageState();
}

class _TargetPageState extends State<TargetPage> {
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
                  "Email",
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
