import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:runningapp/provider/user_provider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:runningapp/widgets/loading.dart';

import 'home_page.dart';
import 'register_page.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['profile', 'email']);

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  GoogleSignInAccount _currentUser;
  final _key = GlobalKey<ScaffoldState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account){
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
  }

  @override
  Widget build(BuildContext context) {
    if (_currentUser != null) {
      return  MaterialApp(
        home: HomePage(),
      );
    }
    final user = Provider.of<UserProvider>(context);

    return Scaffold(
      key: _key,
      body: user.status == Status.Authenticating ? Loading():
      Stack(
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
                    height: 120,
                  ),
                  //Image.asset('ic_car_green.png'),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 6),
                    child: Text(
                      "Welcome back!",
                      style: TextStyle(fontSize: 22, color: Color(0xff333333)),
                    ),
                  ),
                  Text(
                    "Login to continue using Running App",
                    style: TextStyle(fontSize: 16, color: Color(0xff606470)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 100, 0, 20),
                    child: TextField(
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
                  ),
                  TextField(
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
                  Container(
                    constraints: BoxConstraints.loose(Size(double.infinity, 40)),
                    alignment: AlignmentDirectional.centerEnd,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(fontSize: 16, color: Color(0xff606470)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 52,
                      child: RaisedButton(
                        onPressed: ()async {
                          if(!await user.signIn("minhhong0001@gmail.com","123456789"))
                            _key.currentState.showSnackBar(SnackBar(content: Text("Sign in failed")));
                          else{
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          }
                        },
                        child: Text(
                          "Log In",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        color: Color(0xff3277D8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 52,
                      child: RaisedButton(
                        onPressed:_handleSignIn,
                        child: Text(
                          "Login With Google",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        color: Color(0xffdd4b39),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: RichText(
                      text: TextSpan(
                          text: "New user? ",
                          style: TextStyle(color: Color(0xff606470), fontSize: 16),
                          children: <TextSpan>[
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => RegisterPage()));
                                  },
                                text: "Sign up for a new account",
                                style: TextStyle(
                                    color: Color(0xff3277D8), fontSize: 16))
                          ]),
                    ),
                  )

                ],
              ),

            ),
          )

        ],

      ),
    );

  }
  Future<void> _handleSignIn() async{
    try{
      await _googleSignIn.signIn();
    }catch(error){
      print(error);
    }
  }

}
