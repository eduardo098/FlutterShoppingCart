import 'package:flutter/material.dart';
import 'utils/utils.dart';
import 'item_card.dart';
import './model/item.dart';

class ItemList extends StatefulWidget {
  ItemList({Key, key}) : super(key: key);

  @override
  _ItemListState createState() => new _ItemListState();
}

class _ItemListState extends State<ItemList> {
  Future<List> _futureItems;
  @override
  void initState() {
    super.initState();
    _futureItems = getItems();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: _futureItems,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List content = snapshot.data;

            return content.isEmpty ? Center(child: Text("No hay productos disponibles")) : ListView.builder(
              itemCount: content.length,
              itemBuilder: (BuildContext context, int index) {
                return ItemCard(id: content[index].id.toString(),
                  imgUrl: content[index].imgUrl,
                  titulo: content[index].titulo,
                  descripcion: content[index].descripcion,
                  precio: content[index].precio,
                  color: content[index].color);
              }
            );
          }
        }
      )
    );
  }
}