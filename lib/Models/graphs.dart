import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irrigationapp/shared/loading.dart';
import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';

class Graphs extends StatefulWidget {

  @override
  GraphsState createState() => GraphsState();
}
bool loading = false;

class GraphsState extends State<Graphs> {
  @override
  Widget build(BuildContext context) {
    return loading ? Loading():
    Scaffold(
        backgroundColor: Colors.white38,
        appBar: AppBar(
            backgroundColor: Colors.grey,
            title: Text("Graphs",
                style: GoogleFonts.crimsonPro(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            actions: <Widget>[
              Icon(
                  Icons.insert_chart_outlined_outlined,
                  color: Colors.black,
                  size: 50.0
              )]
        ),
      body: Card(
          color: Colors.white38,
          elevation: 0.0,
          margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          child: Column(
              children: [
                Container(
                  alignment: AlignmentDirectional.bottomStart,
                  child: Text("Soil Moisture: ",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.raleway(fontSize: 25.0,color: Colors.blue[900],fontWeight: FontWeight.bold)),
                  padding: EdgeInsets.only(top: 10.0),
                  color: Colors.white38),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 90.0, horizontal: 30.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/SM.PNG'),
                      fit: BoxFit.fill,
                    ),),),
                Container(
                  alignment: AlignmentDirectional.bottomStart,
                  child: Text("Temperature: ",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.raleway(fontSize: 25.0, color: Colors.red[900],
                          fontWeight: FontWeight.bold)),
                  padding: EdgeInsets.only(top: 10.0),
                  color: Colors.white38),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 90.0, horizontal: 30.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/temp.PNG'),
                      fit: BoxFit.fill,
                    ),),),
                Container(
                  alignment: AlignmentDirectional.bottomStart,
                  child: Text("Humidity: ",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.raleway(fontSize: 25.0,color: Colors.yellow[400],fontWeight: FontWeight.bold)),
                  padding: EdgeInsets.only(top: 10.0),
                  color: Colors.white38),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 90.0, horizontal: 30.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/humidity.PNG'),
                      fit: BoxFit.fill,
                    ),),)
              ]
          ))
    );
  }
}
