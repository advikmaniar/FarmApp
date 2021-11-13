import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irrigationapp/Services/auth.dart';
import 'package:irrigationapp/shared/constants.dart';
import 'package:irrigationapp/shared/loading.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState> ();
  bool loading = false;

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Color.fromARGB(255, 134, 196, 111),
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[800],
        elevation: 0.0,
        title: Text("Register for FarmApp",
          style: GoogleFonts.merriweather(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Colors.black ),
        ),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.how_to_reg),
            label: Text("Sign In"),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 80.0, horizontal: 30.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/wallpaper1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget> [
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: "Email"),
                validator: (val) => val.isEmpty ? 'Enter a valid email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: "Password"),
                validator: (val) => val.length < 6 ?
                'Enter a password 6+ characters long' : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.teal[400],
                child: Text(
                    "Register",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0
                    )
                ),
                onPressed: () async {
                  if(_formKey.currentState.validate()) {
                    setState(() => loading = true);
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() {
                          error = 'Error: Please use a valid email';
                          loading =false;
                      });
                    }}},
              ),
              SizedBox(height: 20.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 25.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
