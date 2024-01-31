import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';

class logic_fun extends ChangeNotifier
{
  Uri url = Uri();
  Map m= {};
  bool seacrh=false;
  String str="";

  //first page
  getdata(String str)
  async {
    Uri url=Uri();
    if(str=="")
    {
      url = Uri.https('dummyjson.com','products');
    }
    else
    {
      url=Uri.parse("https://dummyjson.com/products/search?q=$str");
    }

    var response = await http.get(url);

    m=jsonDecode(response.body);
    // print(m);
    return m;
  }
  // getData() async {
  //   url = Uri.https('dummyjson.com','products');
  //   var response = await http.get(url);
  //   m = jsonDecode(response.body);
  //   notifyListeners();
  //   return m;
  // }

  //second page
  getData_show(String id)
  async {
    url = Uri.parse('https://dummyjson.com/products/${id}');
    var response = await http.get(url);
    m = jsonDecode(response.body);
    // notifyListeners();
    return m;
  }

  searchh()
  {
      seacrh=!seacrh;
      notifyListeners();
  }
  not()
  {
    notifyListeners();
  }

}