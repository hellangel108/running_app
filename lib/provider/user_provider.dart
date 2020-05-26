import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:runningapp/models/user.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class UserProvider with ChangeNotifier {
  FirebaseAuth _auth;
  FirebaseUser _user;
  UserData _userData;

  UserData get userData => _userData;
  Status _status = Status.Uninitialized;
  Status get status => _status;
  FirebaseUser get user => _user;
  Firestore _firestore = Firestore.instance;

  UserProvider.initialize() : _auth = FirebaseAuth.instance {
    _auth.onAuthStateChanged.listen(_onStateChanged);
  }

  Future<bool> signIn(String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((user) {
        Firestore.instance
            .collection('users')
            .where("email", isEqualTo: email)
            .snapshots()
            .listen((data) => data.documents.forEach((doc) {
                  _userData = UserData.formSnapShot(doc);
                  notifyListeners();
                }));
      });
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future<bool> signUp(
      String name, String email, String password, String phone) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) {
        _firestore.collection('users').document(user.user.uid).setData({
          'name': name,
          'email': email,
          'uid': user.user.uid,
          'phone': phone
        });
      });
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      print(e.toString());
      return false;
    }
  }

  Future signOut() async {
    _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }
 Future updateData(String id, String name,
     String phone, String weight, String height) async {
   _firestore.collection('users').document(id).updateData({
     'name': name,
     'phone': phone,
     'weight': weight,
     'height': height
   });
   notifyListeners();
 }
  Future updateAvt(String id, String urlAvt) async {
    _firestore.collection('users').document(id).updateData({
      'url_avt': urlAvt,
    });
    notifyListeners();
  }
  Future updateCover(String id, String urlCover) async {
    _firestore.collection('users').document(id).updateData({
      'url_cover': urlCover,
    });
    notifyListeners();
  }
  Future<void> _onStateChanged(FirebaseUser user) async {
    if (user == null) {
      _status = Status.Unauthenticated;
    } else {
      _status = Status.Authenticated;
    }
    notifyListeners();
  }
  Future<void> setName(String name){
    _userData.name = name;
    notifyListeners();
  }
  Future<void> setPhone(String phone){
    _userData.phone = phone;
    notifyListeners();
  }
  Future<void> setHeight(String height){
    _userData.height = height;
    notifyListeners();
  }
  Future<void> setWeight(String weight){
    _userData.weight = weight;
    notifyListeners();
  }
  Future<void> setUrlAvt(String urlAvt){
    _userData.urlAvt = urlAvt;
    notifyListeners();
  }
  Future<void> setUrlCover(String urlCover){
    _userData.urlCover = urlCover;
    notifyListeners();
  }
}
