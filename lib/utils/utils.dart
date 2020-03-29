import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:product_list/model/item.dart';
import 'package:product_list/model/user.dart';
import 'package:provider/provider.dart';
import 'package:product_list/cart_provider.dart';
import 'dart:io';

final String API_URL = "http://192.168.1.74:3000";

Future<List> getItems(BuildContext context, String token) async {

  final response = await http.get(API_URL + "/items", headers: {
    'Authorization' : 'Bearer $token',
  });
  if (response.statusCode == 200) {
    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    return items.map((data) => Item.fromJson(data)).toList();
  } else {
    throw Exception('Failed to get users');
  }
}

Future<User> login(BuildContext context, {Map body}) async {
  var provider = Provider.of<CartProvider>(context);
  return http.post(API_URL + "/auth", body: body).then((http.Response response) {
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception ("Error login");
    } else {
      var data = json.decode(response.body);
      var token = data["token"];
      provider.setAuthToken(token);
    }
  });
}
