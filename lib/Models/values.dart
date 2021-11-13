class Values {
  num humidity;
  num temperature;
  num moisture;
  String led;
  // ignore: non_constant_identifier_names
  String LastIrrD;
  // ignore: non_constant_identifier_names
  String LastIrrT;

  // ignore: non_constant_identifier_names
  Values({this.humidity,this.temperature,this.moisture,this.led,this.LastIrrD,this.LastIrrT});

  Values.fromMap(Map<dynamic, dynamic> map):
        humidity = double.parse(map['Humidity'].toString()),
        temperature = double.parse(map['Temperature'].toString()),
        moisture = int.parse(map['Moisture'].toString()),
        LastIrrD = map["LastIrrD"].toString(),
        LastIrrT = map["LastIrrT"].toString(),
        led = map['MotorControl'].toString();
}