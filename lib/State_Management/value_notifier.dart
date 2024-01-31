import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: v_notifier(),));
}
class v_notifier extends StatefulWidget {
  const v_notifier({super.key});

  @override
  State<v_notifier> createState() => _v_notifierState();
}

class _v_notifierState extends State<v_notifier> {
  TextEditingController h1=TextEditingController();
  TextEditingController h2=TextEditingController();
  ValueNotifier<int>sum=ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Value_Notifier"),),
      body: Column(children: [
        TextField(controller: h1,),
        TextField(controller: h2,),
        SizedBox(height: 20,),
        ElevatedButton(onPressed: () {
          sum.value=int.parse(h1.text)+int.parse(h2.text);
        }, child: Text("Submit")),
        ValueListenableBuilder(valueListenable: sum, builder: (context, value, child) {
          return Text("Sum=${sum.value}");
        },)
      ]),
    );
  }
}
