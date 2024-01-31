import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class classcontroller extends ChangeNotifier
{
  Future getdata()
  async {
    var url = Uri.https('dummyjson.com','products');
    var response = await http.get(url);

    Map m=jsonDecode(response.body);
    // print(m);
    return m;
  }
}