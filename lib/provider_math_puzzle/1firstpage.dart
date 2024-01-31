import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
      runApp(MaterialApp(debugShowCheckedModeBanner: false,home: uipage(),));
}
class uipage extends StatelessWidget {
  const uipage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Math puzzle"),),
      body: Column(

      ),
    );
  }
}

