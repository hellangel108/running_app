import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:runningapp/provider/user_provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _key = GlobalKey<ScaffoldState>();
  bool _isEditName = false;
  bool _isEditEmail = false;
  bool _isEditPhone = false;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      key: _key,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
          Navigator.pop(context);
        }),
        actions: <Widget>[
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.star_border),
            onPressed: () {
            },
          ),
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.edit),
            onPressed: () {

            },
          ),
        ],
      ),
      body: Container(
        color: Colors.grey.withOpacity(0.2),
        child: ListView(
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Container(
                  height: 250,
                  color: Colors.white,
                  child: Image.asset("assets/images/background_profile.jpg", fit: BoxFit.fill,),
                ),
                Container(
                  height: 100.0,
                  width: 100.0,
                  child: Stack(
                    children: <Widget>[
                      CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 100.0,
                          child: Center(
                            child: Icon(Icons.person, size: 80,),
                          )
                      ),
                      //FlatButton.icon(onPressed: , icon: null, label: null)
                    ],
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.person, size: 40,color: Colors.blueAccent,),
                      title: Text("Name",style: TextStyle(fontSize: 18, color: Colors.blueAccent),),
                      subtitle: Text(user.userData.name,style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),),
                      trailing: IconButton(icon: _isEditName ? Icon(Icons.save):Icon(Icons.edit), onPressed: (){
                        setState(() {
                          _isEditName = !_isEditName;
                        });
                      })
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.email, size: 40,color: Colors.blueAccent,),
                      title: Text("Email",style: TextStyle(fontSize: 18, color: Colors.blueAccent),),
                      subtitle: Text(user.userData.email,style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),),
                      trailing: IconButton(icon: _isEditEmail ? Icon(Icons.save):Icon(Icons.edit),
                          onPressed: (){
                            setState(() {
                              _isEditEmail = !_isEditEmail;
                            });},
                        
                            )
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.phone, size: 40,color: Colors.blueAccent,),
                      title: Text("Phone",style: TextStyle(fontSize: 18, color: Colors.blueAccent),),
                      subtitle: Text(user.userData.phone,style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),),
                        trailing: IconButton(icon: _isEditPhone ? Icon(Icons.save):Icon(Icons.edit), onPressed: (){
                          setState(() {
                            _isEditPhone = !_isEditPhone;
                          });
                        })
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
