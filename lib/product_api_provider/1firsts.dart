import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '2second.dart';
import '3third.dart';
import '4four.dart';

void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "first",
    routes: {
      "first" : (context) => first(),
      "second" : (context) => show_data(),
    },
    // home: first(),
  ));
}
class first extends StatelessWidget {
  // const first({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => logic_fun(),
      child: SafeArea(
        child: Consumer<logic_fun>(builder: (context, p, child) {
          return Scaffold(
            appBar: AppBar(title: (p.seacrh==false)?Text("Product"):TextField(onChanged: (value) {
              p.str=value;
            },),
              actions: [
                (p.seacrh==false) ?
                    IconButton(onPressed: () {
                      p.searchh();
                    }, icon: Icon(Icons.search)):
                    IconButton(onPressed: () {
                      p.str="";
                      p.getdata(p.str);
                      p.searchh();
                    }, icon: Icon(Icons.cancel))
              ],
            ),
              body: Consumer<logic_fun>(
                builder: (context, l1, child) {
                  return FutureProvider(
                    create: (context) => l1.getdata("${p.str}"),
                    initialData: l1.getdata("${p.str}"),
                    builder: (context, child) {
                      // print("${l1.m['products']}");
                      List? l = l1.m['products'] as List?;
                      // print("${l}");
                      if(l!=null)
                      {
                        return ListView.builder(
                          itemCount: l.length,
                          itemBuilder: (context, index) {
                            product s = product.fromJson(l[index]);
                            return Card(color: Colors.blueGrey,
                              child: ListTile(
                                onTap: () => Navigator.pushNamed(context,"second",arguments: s),
                                // tileColor: (temp[index]==true)?Colors.grey.shade900:null,
                                title: Text("${s.title}"),
                                subtitle: Text("${s.description}",maxLines: 1),
                                trailing: Text("${s.price} ₹"),
                                leading: Container(
                                  height: 60,
                                  width: 60,
                                  child: Image(image: NetworkImage("${s.thumbnail}"),),
                                ),
                              ),
                            );
                          },
                        );
                      }
                      else
                      {
                        return Center(child: CircularProgressIndicator(),);
                      }
                    },
                  );
                },
              )
          );
        },)
        ),
      );
  }
}