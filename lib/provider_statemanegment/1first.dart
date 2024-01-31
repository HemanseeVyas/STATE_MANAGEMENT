import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '2myclass.dart';



void main()
{
  //provider in flutter
  runApp(MaterialApp(home: MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => myclass(),)
  ],
    child: first(),
  ),));
}
class first extends StatelessWidget {
  // const first({super.key});

  TextEditingController t1=TextEditingController();
  TextEditingController t2=TextEditingController();

  @override
  Widget build(BuildContext context) {
    myclass m=Provider.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("Provider"),),

      body: Column(
        children: [
          TextField(
            controller: t1,
          ),
          TextField(
            controller: t2,
          ),

          SizedBox(height: 10,),
          ElevatedButton(onPressed: () {
            m.fun_sum(t1.text,t2.text);
          }, child: Text("submit")),
          SizedBox(height: 20,),
          Text("${m.sum}"),
        ],
      ),
    );
  }
}
