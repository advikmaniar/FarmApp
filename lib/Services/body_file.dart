import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irrigationapp/Models/values.dart';
import 'package:irrigationapp/Services/auth.dart';


class BodyFile extends StatefulWidget {
  @override
  _BodyFileState createState() => _BodyFileState();
}

class _BodyFileState extends State<BodyFile> {

  final databaseReference = FirebaseDatabase.instance.reference().child("Values");
  final AuthService _auth = AuthService();
  List<Values> list = new List();

  @override
  void initState() {
    super.initState();
    databaseReference.onValue.listen((event) {
      var snap = event.snapshot;
      print("Data: ${snap.value}");
      Map<dynamic,dynamic> data= snap.value;
      final value = Values.fromMap(data);
      list.add(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    Widget UI (num humidity, num temperature, num moisture, String led, String LastIrrD, String LastIrrT) {
      return new GestureDetector(
        child: Column(
          children: [
            Card(
              elevation: 0.0,
              margin: EdgeInsets.fromLTRB(8.0, 2.5, 8.0, 0.0),
              child: Column(
                  children: [
                    Container(
                        height: 200.0,
                        width: 500.0,
                        child: ListTile(
                          title: Image.network("https://www.atsirrigation.com/wp-content/uploads/2018/05/636628432300862859"
                              "_drip%20irrigation%20systems%20in%20washington%20county%20texas%205578.jpg"),
                          tileColor: Color.fromARGB(255, 134, 196, 111)
                        )),
                    ListTile(
                      tileColor: Colors.tealAccent[100],
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 22.0
                      ),
                      title: Text("Soil Moisture: ",
                          style: GoogleFonts.raleway(fontSize: 24.0,
                              color: Colors.blue[900],
                              fontWeight: FontWeight.bold)),
                      subtitle: Text(moisture.toString() + " w/s",
                          style: GoogleFonts.titilliumWeb(fontSize: 28.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      color: Color.fromARGB(255, 134, 196, 111),
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    ListTile(
                      tileColor: Colors.tealAccent[100],
                      leading: Icon(
                        Icons.thermostat_sharp,
                        color: Colors.red,
                        size: 50.0),
                      title: Text("Temperature: ",
                          style: GoogleFonts.raleway(fontSize: 24.0,
                              color: Colors.red[900],
                              fontWeight: FontWeight.bold)),
                      subtitle: Text(temperature.toString() + " °C",
                          style: GoogleFonts.titilliumWeb(fontSize: 28.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10.0),
                      color: Color.fromARGB(255, 134, 196, 111),
                    ),
                    ListTile(
                      tileColor: Colors.tealAccent[100],
                      leading: Icon(
                        Icons.wb_sunny_sharp,
                        color: Colors.yellow,
                        size: 50.0),
                      title: Text("Humidity: ",
                          style: GoogleFonts.raleway(fontSize: 24.0,
                              color: Colors.yellow[900],
                              fontWeight: FontWeight.bold)),
                      subtitle: Text(humidity.toString() + " %",
                          style: GoogleFonts.titilliumWeb(fontSize: 28.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10.0),
                      color: Color.fromARGB(255, 134, 196, 111),
                    ),
                    ListTile(
                      tileColor: Colors.tealAccent[100],
                      leading: Icon(
                        Icons.date_range_sharp,
                        color: Colors.green,
                        size: 50.0,
                      ),
                      title: Text("Last Irrigated on: ",
                          style: GoogleFonts.raleway(fontSize: 24.0,
                              color: Colors.green[500],
                              fontWeight: FontWeight.bold)),
                      subtitle: Text(LastIrrD.toString() +"  => "+ LastIrrT.toString(),
                          style: GoogleFonts.titilliumWeb(fontSize: 25.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 14.0),
                      color: Color.fromARGB(255, 134, 196, 111),
                    ),
                    Container(
                        color: Color.fromARGB(255, 134, 196, 111),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(
                              Icons.do_not_disturb_on,
                              color: Colors.green,
                              size: 35.0,
                            ),
                            RaisedButton(
                              onPressed: () {},
                              color: Colors.green,
                              child: Text("MOTOR ON",
                                style:
                                GoogleFonts.ubuntu(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),),),
                            Container(
                            padding: EdgeInsets.only(right: 5.0)
                            ),
                            RaisedButton(
                              onPressed: () {},
                              color: Colors.red,
                              child: Text("MOTOR OFF",
                                style:
                                GoogleFonts.ubuntu(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),),),
                            Icon(
                              Icons.do_not_disturb_off,
                              color: Colors.red,
                              size: 35.0,
                            ),
                          ],),),
                    Container(
                      padding: EdgeInsets.only(top: 15.0),
                      color: Color.fromARGB(255, 134, 196, 111),
                    ),
                  ]
              )),
            //Bottom Bar
            Card(
              elevation: 0.0,
              margin: EdgeInsets.all(0.0),
              child: Container(
                  child: ListTile(
                    tileColor: Colors.lightGreen[800],
                    leading: Icon(
                        Icons.agriculture_sharp,
                        color: Colors.brown,
                        size: 40.0),
                    title: Text("Motor Status: OFF "+(led.toString()),
                        style: GoogleFonts.orbitron(fontSize: 28.0,
                            color: Colors.brown[900],
                            fontWeight: FontWeight.bold))
                  )),
            )]
        ));
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 134, 196, 111),
      body: new Container(
        child: list.length==0?Text("Data is null"):
        new ListView.builder(
          itemCount: list.length,
            itemBuilder: (_,index){
            return UI(
                list[index].humidity,
                list[index].temperature,
                list[index].moisture,
                list[index].led,
                list[index].LastIrrD,
                list[index].LastIrrT,
            );
          })
      )
    );
  }
}
