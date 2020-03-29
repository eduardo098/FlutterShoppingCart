import 'package:flutter/material.dart';
import 'utils/utils.dart';
import 'item_card.dart';
import './model/item.dart';
import './cart_provider.dart';
import 'package:provider/provider.dart';

class ItemList extends StatefulWidget {
  ItemList({Key, key}) : super(key: key);

  @override
  _ItemListState createState() => new _ItemListState();
}

class _ItemListState extends State<ItemList> {
  Future<List> _futureItems;
  List content;
  @override
  void initState() {
    super.initState();
    var provider = Provider.of<CartProvider>(context, listen: false);
    var token = provider.authToken;
    _futureItems = getItems(context, token);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: _futureItems,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            content = snapshot.data;
            return content.isEmpty ? Center(child: Text("No hay productos disponibles")) : ListView.builder(
              itemCount: content.length,
              itemBuilder: (BuildContext context, int index) {
                return ItemCard(
                  content[index], () => onAddedPressed(index)
                );
              }
            );
          }
        }
      )
    );
  }
  onAddedPressed(int index) {
    final item = content[index];
    print(item.titulo + item.isAdded);
    setState(() {
      item.isAdded = !item.isAdded;    
    });
  }
}