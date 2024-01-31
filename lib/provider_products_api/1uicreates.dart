
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '2classcontroller.dart';
import '3productclass.dart';

void main()
{
  runApp(MaterialApp(debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(create: (BuildContext context) =>classcontroller(),
        child: second(),)));}
class second extends StatelessWidget {
  const second({super.key});

  @override
  Widget build(BuildContext context) {
    Map m={};
    classcontroller c=Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: FutureProvider(
          initialData: c.getdata(),
      create:(context) {
          c.getdata();
      },
        builder: (context, child) {
         // Map m=child as Map;
         dynamic l=m['products'];
            return ListView.builder(
              itemCount: l.length,
              itemBuilder: (context, index) {
                // product s=product.fromJson(l[index]);
                return Card(
                  child: ListTile(
                      // title: Text("${s.title}"),
                  ),
                );
            },);
        },
      ),
    );
  }
}
