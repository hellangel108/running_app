import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:runningapp/provider/user_provider.dart';
import 'package:runningapp/screens/main_page.dart';

import 'package:runningapp/widgets/loading.dart';

import 'home_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _key = GlobalKey<ScaffoldState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);

    return Scaffold(
      key: _key,
      body: user.status == Status.Authenticating
          ? Loading()
          : Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Image.asset(
                    "assets/images/background.jpg",
                    fit: BoxFit.fill,
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.8),
                          Colors.blue,
                          Colors.orange.withOpacity(0.8)
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                  ),
                  constraints: BoxConstraints.expand(),
                  child: SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      color: Colors.white.withOpacity(0.4),
                      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Column(
                        children: <Widget>[

                          SizedBox(
                            height: 120,
                          ),
                          Container(
                            height: 80.0,
                            width: 80.0,
                            child: new CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 100.0,
                              child: Image.asset(
                                "assets/images/icon.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1.0,
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                          //Image.asset('ic_car_green.png'),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 30, 0, 6),
                            child: Text(
                              "XIN CHÀO!",
                              style: TextStyle(
                                  fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            "Đăng nhập tài khoản của bạn",
                            style:
                                TextStyle(fontSize: 16, color: Colors.white),
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
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 2),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(6)),
                                  ),

                              ),
                            ),
                          ),
                          TextField(
                            controller: _passController,
                            style: TextStyle(fontSize: 18, color: Colors.black),
                            obscureText: true,
                            decoration: InputDecoration(
                                labelText: "Mật khẩu",
                                prefixIcon: Container(
                                    width: 50, child: Icon(Icons.vpn_key)),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.orange, width: 2),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)))),
                          ),
                          Container(
                            constraints:
                                BoxConstraints.loose(Size(double.infinity, 40)),
                            alignment: AlignmentDirectional.centerEnd,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Text(
                                "Quên mật khẩu?",
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xff606470)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 52,
                              child: RaisedButton(
                                onPressed: () async {
                                  if (!await user.signIn('minhhong0001@gmail.com',
                                      '123456789'))
                                    _key.currentState.showSnackBar(SnackBar(
                                        content: Text("Đăng nhập không thành công")));
                                  else {
                                   Navigator.pushNamed(context, '/main');
                                  }
                                },
                                child: Text(
                                  "Đăng nhập",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                color: Colors.red,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6))),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                            child: RichText(
                              text: TextSpan(
                                  text: "Bạn chưa có tài khoản? ",
                                  style: TextStyle(
                                      color: Color(0xff606470), fontSize: 16),
                                  children: <TextSpan>[
                                    TextSpan(
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        RegisterPage()));
                                          },
                                        text: "Đăng kí tại đây",
                                        style: TextStyle(
                                            color: Color(0xff3277D8),
                                            fontSize: 16))
                                  ]),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
