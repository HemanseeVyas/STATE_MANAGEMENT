import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '2controller.dart';

void main()
{
  runApp(MaterialApp(debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(create: (BuildContext context) =>controller(),
        child: puzzle(),)));
}

class puzzle extends StatelessWidget {
  const puzzle({super.key});

  @override
  Widget build(BuildContext context) {
    controller c=Provider.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("Number Puzzle"),),
      body: Column(children: [
        SizedBox(height: 60,),
        Row(mainAxisAlignment: MainAxisAlignment.center,children: [
          InkWell(onTap: () {
            c.first();
            c.win();
          },
            child: Container(
              height: 80,
              width: 80,
              color: Colors.deepPurple,
              alignment: Alignment.center,
              child: Text("${c.l[0]}",style: TextStyle(color: Colors.white,fontSize: 20),),
            ),
          ),
          SizedBox(width: 10,),
          InkWell(onTap: () {
            c.second();
            c.win();
          },
            child: Container(
              height: 80,
              width: 80,
              color: Colors.deepPurple,
              alignment: Alignment.center,
              child: Text("${c.l[1]}",style: TextStyle(color: Colors.white,fontSize: 20),),
            ),
          ),
          SizedBox(width: 10,),
          InkWell(onTap: () {
            c.third();
            c.win();
          },
            child: Container(
              height: 80,
              width: 80,
              color: Colors.deepPurple,
              alignment: Alignment.center,
              child: Text("${c.l[2]}",style: TextStyle(color: Colors.white,fontSize: 20),),
            ),
          ),
        ],),
        SizedBox(height: 10,),
        Row(mainAxisAlignment: MainAxisAlignment.center,children: [
          InkWell(onTap: () {
            c.four();
            c.win();
          },
            child: Container(
              height: 80,
              width: 80,
              color: Colors.deepPurple,
              alignment: Alignment.center,
              child: Text("${c.l[3]}",style: TextStyle(color: Colors.white,fontSize: 20),),
            ),
          ),
          SizedBox(width: 10,),
          InkWell(onTap: () {
            c.five();
            c.win();
          },
            child: Container(
              height: 80,
              width: 80,
              color: Colors.deepPurple,
              alignment: Alignment.center,
              child: Text("${c.l[4]}",style: TextStyle(color: Colors.white,fontSize: 20),),
            ),
          ),
          SizedBox(width: 10,),
          InkWell(onTap: () {
            c.six();
            c.win();
          },
            child: Container(
              height: 80,
              width: 80,
              color: Colors.deepPurple,
              alignment: Alignment.center,
              child: Text("${c.l[5]}",style: TextStyle(color: Colors.white,fontSize: 20),),
            ),
          ),
        ],),
        SizedBox(height: 10,),
        Row(mainAxisAlignment: MainAxisAlignment.center,children: [
          InkWell(onTap: () {
            c.seven();
            c.win();
          },
            child: Container(
              height: 80,
              width: 80,
              color: Colors.deepPurple,
              alignment: Alignment.center,
              child: Text("${c.l[6]}",style: TextStyle(color: Colors.white,fontSize: 20),),
            ),
          ),
          SizedBox(width: 10,),
          InkWell(onTap: () {
            c.eight();
            c.win();
          },
            child: Container(
              height: 80,
              width: 80,
              color: Colors.deepPurple,
              alignment: Alignment.center,
              child: Text("${c.l[7]}",style: TextStyle(color: Colors.white,fontSize: 20),),
            ),
          ),
          SizedBox(width: 10,),
          InkWell(onTap: () {
            c.nine();
            c.win();
          },
            child: Container(
              height: 80,
              width: 80,
              color: Colors.deepPurple,
              alignment: Alignment.center,
              child: Text("${c.l[8]}",style: TextStyle(color: Colors.white,fontSize: 20),),
            ),
          ),
        ],),
        SizedBox(height: 30,),
        Text("${c.msg}"),
      ],),
    );
  }
}
