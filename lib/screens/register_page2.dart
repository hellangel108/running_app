import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:runningapp/config/initialization.dart';
import 'package:runningapp/provider/user_provider.dart';
import 'package:runningapp/screens/login_page.dart';
import 'package:runningapp/widgets/loading.dart';

class RegiterPage2 extends StatefulWidget {
  String _name;
  String _email;
  String _pass;
  String _phone;
  RegiterPage2(this._name, this._email, this._pass, this._phone);
  @override
  _RegiterPage2State createState() => _RegiterPage2State();
}

class _RegiterPage2State extends State<RegiterPage2> {
  final _key = GlobalKey<ScaffoldState>();
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
              child: Container(
                color: Colors.white.withOpacity(0.4),
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 80,
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
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                          child: Text(
                            "XIN CHÀO!",
                            style: TextStyle(
                                fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          "Đăng ký tài khoản mới",
                          style:
                          TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 20),
                          child: SizedBox(
                            width: double.infinity,
                            height: 52,
                            child: RaisedButton(
                              onPressed: () async {
                                if (!await user.signUp(
                                    widget._name,widget._email, widget._pass, widget._phone)) {
                                  _key.currentState.showSnackBar(SnackBar(
                                      content: Text("Đăng ý thất bại")));
                                  return;
                                }
                                changeScreenReplacement(context, LoginPage());
                              },
                              child: Text(
                                "Đăng ký",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              color: Color(0xff3277D8),
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
                                text: "Bạn đã có tài khoản? ",
                                style: TextStyle(
                                    color: Color(0xff606470), fontSize: 16),
                                children: <TextSpan>[
                                  TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.pushNamed(context, '/login');
                                        },
                                      text: "Đăng nhập ngay",
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
              )),
        ],
      ),
    );
  }
  void changeScreenReplacement(BuildContext context, Widget widget) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => widget));
  }
}
