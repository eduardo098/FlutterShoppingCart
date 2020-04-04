import 'package:flutter/material.dart';
import 'model/user.dart';
import 'utils/utils.dart';
import 'main.dart';

class Signup extends StatefulWidget {
  Signup({Key key}) : super(key: key);

  @override
  _SignupState createState() => new _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro", style: TextStyle(fontFamily: "Raleway")),
        centerTitle: true,
        elevation: 0,
      ),
        body: Center(
            child: Container(
      padding: EdgeInsets.all(25.0),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Registrate",
            style: TextStyle(fontSize: 25, fontFamily: 'Raleway'),
          ),
          SizedBox(
            height: 50,
          ),
          TextField(
            controller: nameController,
            obscureText: false,
            style: TextStyle(fontFamily: 'Raleway', fontSize: 15.0),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Nombre",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0))),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextField(
            controller: emailController,
            obscureText: false,
            style: TextStyle(fontFamily: 'Raleway', fontSize: 15.0),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Email",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0))),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextField(
            controller: passController,
            obscureText: true,
            style: TextStyle(fontFamily: 'Raleway', fontSize: 15.0),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Contraseña",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0))),
          ),
          SizedBox(
            height: 20.0,
          ),
          ButtonTheme(
            height: 50,
            minWidth: 200,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
              ),
              color: Colors.blue,
              child: const Text(
                "Continuar",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                User user = new User(
                    name: nameController.text,
                    email: emailController.text, 
                    password: passController.text);
                signUp(context, body: user.toMap());
              },
            ),
          )
        ],
      ),
    )));
  }
}
