import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf_create/Getx_statemanegment/mineclass.dart';

void main()
{
  runApp(GetMaterialApp(debugShowCheckedModeBanner: false,home: game(),));
}
class game extends StatelessWidget {
  myclasss m=Get.put(myclasss());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tci_Toe Game"),),
      body: Column(children: [
        Expanded(child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.purple,
          alignment: Alignment.center,
          margin: EdgeInsets.all(10),
          child: Obx(() => Text("${m.msg.value}",style: TextStyle(color: Colors.white,fontSize: 20),),)
        )),
        Expanded(
          child: Row(children: [
            button(0),
            button(1),
            button(2),
          ],),
        ),
        Expanded(
          child: Row(children: [
            button(3),
            button(4),
            button(5),
          ],),
        ),
        Expanded(
          child: Row(children: [
            button(6),
            button(7),
            button(8),
          ],),
        ),
        // ElevatedButton(onPressed: () {
        //   m.reset();
        // }, child: Text("RESET")),
        reset(),

      ]),
    );
  }
  button(int i)
  {
    return Expanded(
      child: InkWell(onTap: () {
        m.get(i);
      },
        child: Container(
          height:double.infinity,
          width: double.infinity,
          margin: EdgeInsets.all(5),
          color: Colors.deepPurple,
          alignment: Alignment.center,
          child: Obx(() => Text("${m.l[i]}",style: TextStyle(fontSize: 20,color: Colors.white),)),
        ),
      ),
    );
  }

  reset()
  {
    return ElevatedButton(onPressed: () {
      m.reset();
    }, child: Text("Reset"));
  }
}
