import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';
import './model/item.dart';

class ItemCard extends StatefulWidget {
  String id;
  String imgUrl;
  String titulo;
  String descripcion;
  double precio;
  String color;

  ItemCard({this.id, this.imgUrl, this.titulo, this.descripcion, this.precio, this.color});

  @override
  _ItemCardState createState() => new _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  var provider;
  var cart;
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<CartProvider>(context);
    cart = provider.itemsCart;
    /*
    if (cart.contains(widget.id)) {
      setState(() {
        isAdded = true;
      });
    }*/
    return new Container(
      height: 380.0,
      width: double.infinity,
      decoration: BoxDecoration(
          color: convertColor(widget.color).withOpacity(0.2),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 8.0,
          ),
          Image.network(
            widget.imgUrl,
            width: 300,
            height: 200,
          ),
          Text(
            widget.titulo.toUpperCase(),
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "Raleway"),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("\$" + widget.precio.toString(),
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Helvetica")),
                    SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton.icon(
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                      ),
                      color: convertColor(widget.color).withOpacity(0.8),
                      onPressed: () {
                        Item item = new Item(
                          id: widget.id,
                          imgUrl: widget.imgUrl,
                          titulo: widget.titulo, 
                          descripcion: widget.descripcion,
                          precio: widget.precio,
                          color: widget.color);
                        if (isAdded) {
                          provider.removeObjectFromCart(widget.id);
                          setState(() {
                            isAdded = false;                            
                          });
                        } else {
                          provider.addObjectToCart(item);
                          setState(() {
                            isAdded = true;                            
                          });
                        }
                      },
                      icon: (isAdded) ? Icon(Icons.remove_shopping_cart) : Icon(Icons.add_shopping_cart),
                      label: (isAdded) ? Text("Remover del carrito") : Text("Agregar al carrito"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      margin: EdgeInsets.all(25.0),
    );
  }
}

Color convertColor(String hexColor) {
  hexColor = hexColor.replaceAll("#", "");
  if(hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }

  if (hexColor.length == 8) {
    return Color(int.parse("0x$hexColor"));
  }
}
