import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'coadingfile.dart';


void main(){
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: tick(),));
}
class tick extends StatelessWidget {
  const tick({super.key});
  @override
  Widget build(BuildContext context) {
    tic_logic t=Get.put(tic_logic());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("TIC-TAC-TOE"),
      ),

      body: Column(children: [
        SizedBox(height: 10,),

        Row(mainAxisAlignment: MainAxisAlignment .spaceEvenly,children:[
          InkWell(onTap: () => (t.is_win.value==false && t.m.value[0]==false? t.get("0"):null),child: Container(height: 100,width: 100,color: Colors.cyan,child: Obx((){return Text("${t.l.value[0]}",style: TextStyle(fontSize: 20),);}),alignment: Alignment.center,)),
          InkWell(onTap: () => (t.is_win.value==false && t.m.value[1]==false?t.get("1"):null),child: Container(height: 100,width: 100,color: Colors.cyan,child: Obx((){return Text("${t.l.value[1]}",style: TextStyle(fontSize: 20),);}),alignment: Alignment.center)),
          InkWell(onTap: () => (t.is_win.value==false && t.m.value[2]==false?t.get("2"):null),child: Container(height: 100,width: 100,color: Colors.cyan,child: Obx((){return Text("${t.l.value[2]}",style: TextStyle(fontSize: 20),);}),alignment: Alignment.center)),
        ],),
        SizedBox(height: 10,),
        Row(mainAxisAlignment: MainAxisAlignment .spaceEvenly,children:[
          InkWell(onTap: () => (t.is_win.value==false && t.m.value[3]==false?t.get("3"):null),child: Container(height: 100,width: 100,color: Colors.cyan,child: Obx((){return Text("${t.l.value[3]}",style: TextStyle(fontSize: 20),);}),alignment: Alignment.center)),
          InkWell(onTap: () => (t.is_win.value==false && t.m.value[4]==false?t.get("4"):null),child: Container(height: 100,width: 100,color: Colors.cyan,child: Obx((){return Text("${t.l.value[4]}",style: TextStyle(fontSize: 20),);}),alignment: Alignment.center)),
          InkWell(onTap: () => (t.is_win.value==false && t.m.value[5]==false?t.get("5"):null),child: Container(height: 100,width: 100,color: Colors.cyan,child: Obx((){return Text("${t.l.value[5]}",style: TextStyle(fontSize: 20),);}),alignment: Alignment.center)),
        ],),
        SizedBox(height: 10,),
        Row(mainAxisAlignment: MainAxisAlignment .spaceEvenly,children:[
          InkWell(onTap: () => (t.is_win.value==false && t.m.value[6]==false?t.get("6"):null),child: Container(height: 100,width: 100,color: Colors.cyan,child: Obx((){return Text("${t.l.value[6]}",style: TextStyle(fontSize: 20),);}),alignment: Alignment.center)),
          InkWell(onTap: () => (t.is_win.value==false && t.m.value[7]==false?t.get("7"):null),child: Container(height: 100,width: 100,color: Colors.cyan,child: Obx((){return Text("${t.l.value[7]}",style: TextStyle(fontSize: 20),);}),alignment: Alignment.center)),
          InkWell(onTap: () => (t.is_win.value==false && t.m.value[8]==false?t.get("8"):null),child: Container(height: 100,width: 100,color: Colors.cyan,child: Obx((){return Text("${t.l.value[8]}",style: TextStyle(fontSize: 20),);}),alignment: Alignment.center)),
        ],),
        SizedBox(height: 10,),
        Container(
            child: Obx(() {
              return Text("${t.msg.value}");
            })
        ),
        ElevatedButton(onPressed: () {

        }, child: Text("RESET")),


      ],),
    );
  }
}
