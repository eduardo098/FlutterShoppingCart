import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';
import './model/item.dart';
import 'item_list.dart';

class ItemCard extends StatelessWidget {
  Item itemAdded;
  Function isAddedPressed;
  var provider;
  var cart;

  ItemCard(this.itemAdded, this.isAddedPressed);
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<CartProvider>(context, listen: true);
    cart = provider.itemsCart;
    var itemState = provider.isAdded;
    return new Container(
      height: 380.0,
      width: double.infinity,
      decoration: BoxDecoration(
          color: convertColor(this.itemAdded.color).withOpacity(0.2),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 8.0,
          ),
          Image.network(
            this.itemAdded.imgUrl,
            width: 300,
            height: 200,
          ),
          Text(
            this.itemAdded.titulo.toUpperCase(),
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
                    Text("\$" + this.itemAdded.precio.toString(),
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Helvetica")),
                    SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton.icon(
                        icon: itemState
                            ? Icon(Icons.remove_shopping_cart)
                            : Icon(Icons.add_shopping_cart),
                        label: itemState
                            ? Text("Remover del carrito")
                            : Text("Agregar al carrito"),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                        ),
                        color:
                            convertColor(this.itemAdded.color).withOpacity(0.8),
                        onPressed: () {
                          
                          if (itemState) {
                            provider.removeObjectFromCart(this.itemAdded.id);
                          } else {
                            provider.addObjectToCart(this.itemAdded);
                          }
                        }),
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
  /*
  assignCartFunction(Item item) {
    if (this.itemAdded.isAdded) {
        provider.removeObjectFromCart(this.itemAdded.id);
    } else {
        provider.addObjectToCart(this.itemAdded);
    }
  } */
}

Color convertColor(String hexColor) {
  hexColor = hexColor.replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }

  if (hexColor.length == 8) {
    return Color(int.parse("0x$hexColor"));
  }
}
