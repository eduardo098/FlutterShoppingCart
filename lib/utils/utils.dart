import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:product_list/model/item.dart';

final String API_URL = "http://192.168.1.74:3000";

Future<List> getItems() async {
  String url = 'http://192.168.1.68:3000/usuarios';
  final response = await http.get(API_URL + "/items");

  if (response.statusCode == 200) {
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    return items.map((data) => Item.fromJson(data)).toList();
  } else {
    throw Exception('Failed to get users');
  }
}
