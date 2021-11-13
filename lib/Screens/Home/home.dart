import 'dart:ui';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irrigationapp/Models/graphs.dart';
import 'package:irrigationapp/Models/live_graphs.dart';
import 'package:irrigationapp/Models/values.dart';
import 'package:irrigationapp/Services/auth.dart';
import 'package:irrigationapp/Services/database.dart';
import 'package:irrigationapp/Services/body_file.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();
  final databaseReference = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {

    void _bottomPanel() {
      showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,builder: (context){
        return Container(
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0)
                )),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FlatButton.icon(
                    icon: Icon(Icons.stacked_line_chart),
                    label: Text("Demo graphs"),
                    onPressed: ()  {
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => GraphScreen())
                      );
                      },
                  ),
                  FlatButton.icon(
                    icon: Icon(Icons.insert_chart_outlined_outlined),
                    label: Text("View graphs"),
                    onPressed: ()  {
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Graphs())
                      );
                    },
                  ),
                  FlatButton.icon(
                    icon: Icon(Icons.settings),
                    label: Text("Settings"),
                    onPressed: () => {Navigator.pop(context)},
                  ),
                  FlatButton.icon(
                    icon: Icon(Icons.logout),
                    label: Text("Logout"),
                    onPressed: () async {
                      Navigator.pop(context);
                      await _auth.signOut();
                      },
                  ),
                ]));
          });
    }
    return StreamProvider<List<Values>>.value(
      value: DatabaseService().data,
      child: Scaffold(
      backgroundColor: Color.fromARGB(255, 134, 196, 111),

        appBar: AppBar(
        title: Text("FarmApp",
          style: GoogleFonts.crimsonPro(
              fontSize: 45.0,
              fontWeight: FontWeight.bold,
              color: Colors.black)),
          backgroundColor: Colors.lightGreen[800],
          actions: <Widget>[
            IconButton(
              onPressed: () => _bottomPanel(),
              iconSize: 40.0,
              icon: Icon(Icons.more_horiz),
              color: Colors.black,
            ),
        ],),

        body: Container(
          child: BodyFile(),
        ),
      ));
  }
}
