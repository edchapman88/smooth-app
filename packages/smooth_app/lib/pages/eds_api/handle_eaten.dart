
import 'dart:convert';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;


void handleEaten(Product product) async  {
  var url = dotenv.env['BACKEND_URL']! + 'postData';
  final now = DateTime.now();
  var res = await http.post(Uri.parse(url), body: jsonEncode({
    'date' : now.toIso8601String(),
    'product' : product.toJson()
  }));
}

