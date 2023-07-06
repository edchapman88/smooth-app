
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:smooth_app/pages/eds_api/record_interface.dart';

void handleRecord(RecordObj record) async  {
  var url = dotenv.env['BACKEND_URL']! + 'recordData';
  var res = await http.post(Uri.parse(url), body: jsonEncode(record));
  // print(res.toString());
}

