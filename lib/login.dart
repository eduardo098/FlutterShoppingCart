import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
            padding: EdgeInsets.all(25.0),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Bienvenido a la Tiendita", style: TextStyle(fontSize: 25, fontFamily: 'Raleway'),),
                SizedBox(
                  height: 50,
                ),
                TextField(
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
                    child: const Text("Iniciar sesión", style: TextStyle(color: Colors.white),),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          )));
  }
}