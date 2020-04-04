import 'package:flutter/material.dart';
import './model/item.dart';

class CartProvider with ChangeNotifier {

  List<Item> _itemsCart = List<Item>();
  List<Item> get itemsCart => _itemsCart;

  String _authToken = '';
  String get authToken => _authToken;

  bool _isAdded = false;
  bool get isAdded => _isAdded;

  /*
  void changeItemState(String id) {
    for (int i = 0; i < _itemsCart.length; i++) {
      if (_itemsCart[i].id == id) {
        itemsCart[i].isAdded = !itemsCart[i].isAdded;
      }
    }
    notifyListeners();
  } */

  void addObjectToCart(Item item) {
    if(!_itemsCart.contains(item)){
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
    notifyListeners();
  }

  void removeAuthToken() {
    this._authToken = '';
    notifyListeners();
  }
}