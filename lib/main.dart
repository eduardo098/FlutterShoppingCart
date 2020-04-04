import 'package:flutter/material.dart';
import 'shopping_cart.dart';
import 'item_list.dart';
import 'cart_provider.dart';
import 'package:provider/provider.dart';
import 'login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartProvider>(
        builder: (context) => CartProvider(),
        child: MaterialApp(
            theme: ThemeData(primaryColor: Colors.white), home: Login()));
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(
          "Tiendita",
          style: TextStyle(color: Colors.black87, fontFamily: "Raleway"),
        ),
        backgroundColor: Color(0xFFFFFF),
        elevation: 0,
        centerTitle: true,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  signOut(context);
                },
                child: Text("Cerrar sesión")
              )),
        ],
      ),
      body: ItemList(),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          "Mi carrito",
          style: TextStyle(color: Colors.black87),
        ),
        icon: Icon(Icons.shopping_cart, color: Colors.black87),
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ShoppingCart()),
          );
        },
      ),
    );
  }

  void signOut(BuildContext context) {
    var provider = Provider.of<CartProvider>(context);
    provider.removeAuthToken();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
    );
  }
}
