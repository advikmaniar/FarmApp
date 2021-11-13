import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irrigationapp/Models/values.dart';

class ValueTile extends StatelessWidget {

  final Values value;
  ValueTile({this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 15.0),
        child: Card(
            elevation: 0.0,
            margin: EdgeInsets.fromLTRB(8.0, 2.5, 8.0, 0.0),
            child: Column(
              children: [
                Container(
                height: 200.0,
                width: 400.0,
                child:
                ListTile(
                      title: Image.network("https://www.atsirrigation.com/wp-content/uploads/2018/05/636628432300862859"
                          "_drip%20irrigation%20systems%20in%20washington%20county%20texas%205578.jpg"),
                      tileColor: Color.fromARGB(255, 134, 196, 111),
                )),
                ListTile(
                  tileColor: Colors.tealAccent[100],
                  leading: CircleAvatar(
                    radius: 25.0,
                    backgroundColor: Colors.blue),
                  title: Text("Moisture Content: ",
                    style: GoogleFonts.raleway(fontSize: 24.0,
                    color: Colors.blue[900],
                      fontWeight: FontWeight.bold)),
                  subtitle: Text((value.moisture).toString() + " w/s",
                    style: GoogleFonts.titilliumWeb(fontSize: 25.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
                ),
                Container(
                  color: Color.fromARGB(255, 134, 196, 111),
                  padding: EdgeInsets.only(top: 25.0),
                ),
                ListTile(
                  tileColor: Colors.tealAccent[100],
                  leading: CircleAvatar(
                      radius: 25.0,
                      backgroundColor: Colors.red),
                  title: Text("Temperature: ",
                      style: GoogleFonts.raleway(fontSize: 24.0,
                          color: Colors.red[900],
                          fontWeight: FontWeight.bold)),
                  subtitle: Text((value.temperature).toString() + " °C",
                      style: GoogleFonts.titilliumWeb(fontSize: 25.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: EdgeInsets.only(top: 25.0),
                  color: Color.fromARGB(255, 134, 196, 111),
                ),
                ListTile(
                  tileColor: Colors.tealAccent[100],
                  leading: CircleAvatar(
                      radius: 25.0,
                      backgroundColor: Colors.brown),
                  title: Text("Humidity: ",
                      style: GoogleFonts.raleway(fontSize: 24.0,
                          color: Colors.brown[500],
                          fontWeight: FontWeight.bold)),
                  subtitle: Text((value.humidity).toString() + " %",
                      style: GoogleFonts.titilliumWeb(fontSize: 28.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 50.0),
                  color: Color.fromARGB(255, 134, 196, 111),
                ),
                Container(
                  color: Colors.tealAccent[100],
                  height: 100.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(
                        Icons.do_not_disturb_on,
                        color: Colors.green,
                        size: 40.0,
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
                        size: 40.0,
                      ),
                    ],),),
              ]
            )
        ));
  }
}
