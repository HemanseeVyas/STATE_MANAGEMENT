import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pdf_create/provider_statemanegment/2myclass.dart';
import 'package:provider/provider.dart';

import '2mycontrollerclass.dart';

void main()
{
      runApp(MaterialApp(debugShowCheckedModeBanner: false,
          home: ChangeNotifierProvider(create: (BuildContext context) =>myclasscontroller(),
      child: firsts(),)));
}
class firsts extends StatelessWidget {
  // const firsts({super.key});
  TextEditingController t1=TextEditingController();

  @override
  Widget build(BuildContext context) {

    myclasscontroller m=Provider.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("Provider..."),),
      body: Column(children: [
        SizedBox(height: 10,),
        TextField(controller: t1,),
        ElevatedButton(onPressed: () {
            m.credit(t1.text);
        }, child: Text("Credit")),
        SizedBox(height: 10,),
        ElevatedButton(onPressed: () {
          m.debit(t1.text);
        }, child: Text("Debit")),
        Text("Total Amount = ${m.amount}"),
      ]),
    );
  }
}
