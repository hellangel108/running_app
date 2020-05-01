
import 'package:cloud_firestore/cloud_firestore.dart';

class User{
  final String uid;
  User({this.uid});
}

class UserData{
  static const ID = 'id';
  static const NAME = 'name';
  static const EMAIL = 'email';
  static const PHONE = 'phone';
  static const PASS = 'pass';

  String _id;
  String _name;
  String _email;
  String _phone;
  String _pass;

  String get pass => _pass;

  set name(String value) {
    _name = value;
  }

  String get id => _id;

  String get name => _name;

  String get email => _email;

  String get phone => _phone;

  UserData.formSnapShot(DocumentSnapshot snapshot){
    Map data = snapshot.data;
    _name = data[NAME];
    _email = data[EMAIL];
    _phone = data[PHONE];
  }

  set email(String value) {
    _email = value;
  }

  set phone(String value) {
    _phone = value;
  }

  set pass(String value) {
    _pass = value;
  }
}