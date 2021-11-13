import 'package:flutter/material.dart';
import 'package:irrigationapp/Models/values.dart';
import 'package:irrigationapp/Screens/Home/values_tile.dart';
import 'package:provider/provider.dart';

class SensorValues extends StatefulWidget {
  @override
  _SensorValuesState createState() => _SensorValuesState();
}

class _SensorValuesState extends State<SensorValues> {
  @override
  Widget build(BuildContext context) {

    final values = Provider.of<List<Values>>(context);
    
    return ListView.builder(
      itemCount: values.length,
      itemBuilder: (context, index) {
        return ValueTile(value: values[index]);
      },
    );
  }
}
