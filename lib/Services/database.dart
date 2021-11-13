import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:irrigationapp/Models/values.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  final CollectionReference dataCollection = FirebaseFirestore.instance.collection('Sensor Values');

  Future updateUserData(num humidity, num temperature, num moisture, bool led) async{
    return await dataCollection.doc(uid).set({
      'humidity':humidity,
      'temperature':temperature,
      'moisture':moisture,
      'led':led,
    });
  }
  //values from snapshot
  List<Values> _valueListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc){
      return Values (
        humidity: doc.data()['humidity'] ?? 0,
        temperature: doc.data()['temperature'] ?? 0,
        moisture: doc.data()['moisture'] ?? 0,
        led: doc.data()['led'] ?? 0,
      );
    }).toList();
  }

  //get data streams
  Stream<List<Values>> get data {
    return dataCollection.snapshots().map(_valueListFromSnapshot);
  }
}