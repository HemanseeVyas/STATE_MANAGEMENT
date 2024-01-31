import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pdf_create/State_Management/sumclass.dart';

void main()
{
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: manage(),));
}
class manage extends StatelessWidget {
  const manage({super.key});

  @override
  Widget build(BuildContext context) {
    myclass m=Get.put(myclass());
    TextEditingController t1=TextEditingController();
    TextEditingController t2=TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text("State_Management"),),
      body: Column(children: [
        TextField(
          controller: t1,
        ),
        TextField(
          controller: t2,
        ),
        SizedBox(height: 20,),
        ElevatedButton(onPressed: () {
            m.fun_sum(t1.text, t2.text);

        }, child: Text("Submit")),
        SizedBox(height: 20,),
        //value particular change krva mate
        Obx(() {
            return Text("Sum=${m.sum.value}");
        }),
      ]),
    );
  }
}

