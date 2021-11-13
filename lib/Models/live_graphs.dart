import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irrigationapp/Models/values.dart';
import 'package:irrigationapp/Services/body_file.dart';
import 'package:irrigationapp/shared/loading.dart';

class GraphScreen extends StatefulWidget {
  @override
  _GraphScreenState createState() => _GraphScreenState();
}
bool loading = false;
final databaseReference = FirebaseDatabase.instance.reference().child("Values");
List<Values> list = new List();
num M;
num T;
num H;
String D;

class _GraphScreenState extends State<GraphScreen> {
  @override
  void initState() {
    super.initState();
    databaseReference.onValue.listen((event) {
      var snap = event.snapshot;
      print("Data: ${snap.value}");
      Map<dynamic,dynamic> data= snap.value;
      final value = Values.fromMap(data);
      list.add(value);
      M = value.moisture;
      T = value.temperature;
      H = value.humidity;
      D = value.LastIrrD;
      print([M,T,H,D]);
    });
  }

  final List<Feature> moisture = [
    Feature(
      title: "Soil Moisture",
      color: Colors.blue[900],
      data: [150/800, 100/800, 200/800, 400/800, 300/800, 100/800],
    ),
  ];
  final List<Feature> temperature = [
    Feature(
      title: "Temperature",
      color: Colors.red[900],
      data: [1, 0.8, 0.6, 0.7, 0.4, 0.3],
    ),
  ];
  final List<Feature> humidity = [
    Feature(
      title: "Humidity",
      color: Colors.yellow,
      data: [40/80, 50/80, 45/80, 60/80, 50/80, 65/80],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return loading ? Loading():
    Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            backgroundColor: Colors.grey,
            title: Text("Demo Graphs",
                style: GoogleFonts.crimsonPro(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            actions: <Widget>[
              Icon(
                  Icons.insert_chart_outlined_outlined,
                  color: Colors.black,
                  size: 50.0
              )
            ]
        ),
        body: Card(
          color: Colors.white38,
          elevation: 0.0,
          margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            Container(
                alignment: AlignmentDirectional.bottomStart,
                child: Text("Soil Moisture: ",
                    style: GoogleFonts.raleway(fontSize: 25.0,color: Colors.blue[900],fontWeight: FontWeight.bold)),
                color: Colors.black
            ),
            Container(
                alignment: AlignmentDirectional.bottomStart,
                child: LineGraph(
                  features: moisture,
                  size: Size(420, 180),
                  labelX: ['Day 1', 'Day 2', 'Day 3', 'Day 4', 'Day 5', 'Day 6'],
                  labelY: ['200', '400', '600', '800'],
                  //showDescription: true,
                  graphColor: Colors.white,
                )
            ),
            Container(
                alignment: AlignmentDirectional.bottomStart,
                child: Text("Temperature: ",
                    style: GoogleFonts.raleway(fontSize: 25.0,color: Colors.red[900],fontWeight: FontWeight.bold)),
                color: Colors.black
            ),
            Container(
                alignment: AlignmentDirectional.bottomStart,
                child: LineGraph(
                    features: temperature,
                    size: Size(420, 180),
                    labelX: ['Day 1', 'Day 2', 'Day 3', 'Day 4', 'Day 5', 'Day 6'],
                    labelY: ['25°C','30°C','35°C','40°C'],
                    //showDescription: true,
                    graphColor: Colors.white
                )
            ),
            Container(
                alignment: AlignmentDirectional.bottomStart,
                child: Text("Humidity: ",
                    style: GoogleFonts.raleway(fontSize: 25.0,color: Colors.brown[500],fontWeight: FontWeight.bold)),
                color: Colors.black
            ),
            Container(
                alignment: AlignmentDirectional.bottomStart,
                child: LineGraph(
                    features: humidity,
                    size: Size(420, 180),
                    labelX: ['Day 1', 'Day 2', 'Day 3', 'Day 4', 'Day 5', 'Day 6'],
                    labelY: ['20%', '40%', '60%', '80%'],
                    //showDescription: true,
                    graphColor: Colors.white
                )
            ),
            Container(
              color: Colors.grey,
              height: 20,
            )
          ],
        ),
        ));
  }
}