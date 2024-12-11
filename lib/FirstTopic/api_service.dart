import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<Map<String, dynamic>> get() async {
    try {
      const uri = 'https://api.currencyapi.com/v3/latest?apikey=cur_live_eek23Cta4J2rHNFKnplUXG9Whmua6jVuQIcQKbWk';
      final client = http.Client();

      Future.delayed(const Duration(seconds: 10)).whenComplete(() => client.close());

      http.Response response = await client.get(Uri.parse(uri));

      Map<String, dynamic> result = json.decode(utf8.decode(response.bodyBytes));
      return result;
    } catch (e) {
      debugPrint(e.toString());
      await get();
      rethrow;
    }
  }
}
