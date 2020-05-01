import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:runningapp/provider/user_provider.dart';
import 'package:runningapp/screens/home_page.dart';
import 'package:runningapp/screens/login_page.dart';

import 'package:runningapp/widgets/loading.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _genderController = new TextEditingController();
  TextEditingController _weightController = new TextEditingController();
  TextEditingController _heightController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();

  final _key = GlobalKey<ScaffoldState>();

  //final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      key: _key,
      body: user.status ==Status.Authenticating?Loading():Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset("assets/images/background.jpg",fit: BoxFit.fill,),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              constraints: BoxConstraints.expand(),
              color: Colors.white70,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 6),
                      child: Text(
                        "Welcome Aboard!",
                        style: TextStyle(fontSize: 22, color: Color(0xff333333)),
                      ),
                    ),
                    Text(
                      "Signup with Running App in simple steps",
                      style: TextStyle(fontSize: 16, color: Color(0xff606470)),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: TextField(

                        controller: _nameController,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        decoration: InputDecoration(
                            labelText: "Name",
                            prefixIcon: Container(
                                width: 50, child: Icon(Icons.person)),
                            border: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Color(0xffCED0D2), width: 1),
                                borderRadius: BorderRadius.all(Radius.circular(6)))),
                      ),
                    ),
                    TextField(
                      controller: _phoneController,
                      style: TextStyle(fontSize: 18, color: Colors.black),

                      decoration: InputDecoration(
                          labelText: "Phone Number",
                          prefixIcon: Container(
                              width: 50, child: Icon(Icons.phone)),
                          border: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Color(0xffCED0D2), width: 1),
                              borderRadius: BorderRadius.all(Radius.circular(6)))),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: TextField(

                        controller: _genderController,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        decoration: InputDecoration(
                            labelText: "Gender",
                            prefixIcon: Container(
                                width: 50, child: Icon(Icons.account_box)),
                            border: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Color(0xffCED0D2), width: 1),
                                borderRadius: BorderRadius.all(Radius.circular(6)))),
                      ),
                    ),
                    TextField(
                      controller: _weightController,
                      style: TextStyle(fontSize: 18, color: Colors.black),

                      decoration: InputDecoration(
                          labelText: "Weight",
                          prefixIcon: Container(
                              width: 50, child: Icon(Icons.line_weight)),
                          border: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Color(0xffCED0D2), width: 1),
                              borderRadius: BorderRadius.all(Radius.circular(6)))),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child:
                      TextField(

                        controller: _heightController,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        decoration: InputDecoration(
                            labelText: "Height",
                            prefixIcon: Container(
                                width: 50, child: Icon(Icons.line_weight)),
                            border: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Color(0xffCED0D2), width: 1),
                                borderRadius: BorderRadius.all(Radius.circular(6)))),
                      ),
                    ),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        decoration: InputDecoration(
                            labelText: "Email",
                            prefixIcon: Container(
                                width: 50, child: Icon(Icons.email)),
                            border: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Color(0xffCED0D2), width: 1),
                                borderRadius: BorderRadius.all(Radius.circular(6)))),
                      ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: TextField(
                      controller: _passController,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Password",
                          prefixIcon: Container(
                              width: 50, child: Icon(Icons.vpn_key)),
                          border: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Color(0xffCED0D2), width: 1),
                              borderRadius: BorderRadius.all(Radius.circular(6)))),
                    ),
                ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: RaisedButton(
                          onPressed: () async {
                            if(!await user.signUp(_nameController.text ,_emailController.text, _passController.text, _phoneController.text)){
                              _key.currentState.showSnackBar(SnackBar(content: Text("Sign up failed")));
                              return;
                            }
                            changeScreenReplacement(context, LoginPage());
                          },
                          child: Text(
                            "Sign up",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          color: Color(0xff3277D8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(6))),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: RichText(
                        text: TextSpan(
                            text: "Already a User? ",
                            style: TextStyle(color: Color(0xff606470), fontSize: 16),
                            children: <TextSpan>[
                              TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pop(context);
                                    },
                                  text: "Login now",
                                  style: TextStyle(
                                      color: Color(0xff3277D8), fontSize: 16))
                            ]),
                      ),
                    )
                  ],
                ),
              )

          ),
        ],
      ),
    );
  }

  void changeScreenReplacement(BuildContext context,Widget widget) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => widget));
  }
}
