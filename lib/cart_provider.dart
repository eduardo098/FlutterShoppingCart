import 'package:flutter/material.dart';
import './model/item.dart';

class CartProvider with ChangeNotifier {
  /*
  Map<String, dynamic> _cart = {};

  Map<String, dynamic> get cart => _cart;

  void addToCart(String index) {
    if (_cart.containsKey(index)) {
      _cart[index] += 1;
    } else {
      _cart[index] = 1;
    }
    notifyListeners();
  }*/

  List<Item> _itemsCart = List<Item>();
  List<Item> get itemsCart => _itemsCart;

  String _authToken = '';
  String get authToken => _authToken;

  void addObjectToCart(Item item) {
    if(!_itemsCart.asMap().containsValue(item.id)){
      _itemsCart.add(item);
      notifyListeners();
    }
  }

  void removeObjectFromCart(String id) {
      _itemsCart.removeWhere((item) => item.id == id);
      notifyListeners();
  }

  void setAuthToken(String token) {
    this._authToken = token;
  }
}