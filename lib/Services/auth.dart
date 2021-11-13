import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:irrigationapp/Models/appUser.dart';
import 'package:irrigationapp/Services/database.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  //Create user object on firebase
  appUser _userFromFirebaseUser(User user) {
    return user != null ? appUser(uid: user.uid) : null;
  }

  Stream<appUser> get user {
    return _auth.authStateChanges()
        .map(_userFromFirebaseUser);
  }

//Sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  //Sign In with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;

      //Create new document for user
      await DatabaseService(uid: user.uid).updateUserData(52, 32.1, 275, true);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  //Signing Out
    Future signOut() async {
      try {
        return await _auth.signOut();
      } catch (e) {
        print(e.toString());
        return null;
      }
    }
  }
