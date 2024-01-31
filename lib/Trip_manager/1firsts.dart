import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdf_create/Trip_manager/2Add_trip_name.dart';

void main()
{
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: trip(),));
}
class trip extends StatefulWidget {
  const trip({super.key});

  @override
  State<trip> createState() => _tripState();
}

class _tripState extends State<trip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Trip_Manager"),),
      body: Column(
        children: [
          Container(
            height: 200,
            width: 200,
            color: Colors.purple,
            alignment: Alignment.center,
            margin: EdgeInsets.all(80),
            child: Text("     One-Stop Travel \n           Plateform"
                "\n\n     By Your Side 24/7 \n           Lightning-\nFast Customer Support",style: TextStyle(color: Colors.white,fontSize: 18),),
          ),
          TextButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return names_add();
                },));
          }, child: Text("Enter Your App"))
        ],
      ),
    );
  }
}
