import 'package:flutter/material.dart';
import './model/item.dart';

class ItemCart extends StatefulWidget {
  Item item;

  ItemCart({this.item});

  @override
  _ItemCartState createState() => new _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(20.0),
      leading: Image.network(widget.item.imgUrl),
      title: Text(widget.item.titulo,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              fontFamily: "Helvetica")),
      subtitle: Text(widget.item.descripcion.toString(), style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Raleway")),
      trailing: Text("\$${widget.item.precio.toString()}", style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Helvetica")),
    );
  }
}
