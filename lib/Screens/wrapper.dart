import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:irrigationapp/Models/appUser.dart';
import 'package:irrigationapp/Screens/Authentication/authenticate.dart';
import 'package:irrigationapp/Screens/Home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<appUser>(context);

    if(user == null){
      return Authenticate();
    } else{
      return Home();
    }
  }
}


