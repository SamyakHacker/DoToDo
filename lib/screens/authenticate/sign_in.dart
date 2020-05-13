import 'package:dotodo/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  //TODO: Set state variables
  bool hidePassword = true;
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[200],
      //TODO: Have AppBar as a exported method to be used by all screens
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[500],
        centerTitle: true,
        title: Text("Do-ToDo"),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                  onChanged: (val) {
                    setState(() => email = val);
                  }
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: hidePassword,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.green,
                child: Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  print(email);
                  print(password);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  RaisedButton guestSignIn() {
    return RaisedButton(
      child: Text('Sign in as Guest'),
      onPressed: () async {
        dynamic result = await _auth.signInAnon();
        if (result == null) {
          print("Error Signing On");
        } else {
          print('Signed In');
          print(result);
        }
      },
    );
  }
}