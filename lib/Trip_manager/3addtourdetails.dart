import 'package:flutter/material.dart';
import 'package:pdf_create/Trip_manager/2Add_trip_name.dart';

import '4particularentry.dart';

class details_add extends StatefulWidget {
  Map l;
  details_add(this.l);

  @override
  State<details_add> createState() => _details_addState();
}

class _details_addState extends State<details_add> {
  List<Map> l=[];
  TextEditingController t2=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // member_datas();
  }
  member_datas()
  async {
      String sql="select * from memberdata where mb=${widget.l['id']}";
      l=await names_add.database!.rawQuery(sql);
      setState(() {

      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.l['name']}"),),

      body: FutureBuilder(future: member_datas(),
        builder: (context, snapshot) {
        return Column(
          children: [
            Container(
              height: 60,
              width: double.infinity,
              color: Colors.white,
              alignment: Alignment.center,
              margin: EdgeInsets.all(10),
              child: Text("Add Your All Member",style: TextStyle(color: Colors.deepPurple,fontSize: 20),),
            ),
            Expanded(flex: 12,child: Container(
              child: ListView.builder(
                itemCount: l.length,
                itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return particulardatas(l[index]);
                      },));
                    },
                    title: Text("${l[index]['name']}"),
                    trailing: Wrap(children: [
                      IconButton(onPressed: () {
                        //future builder -> setstate
                        //Listview builder -> pushreplacement
                        String sql="delete from memberdata where id=${l[index]['id']}";
                        names_add.database!.rawDelete(sql);
                        setState(() {

                        });
                        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                        //       return details_add();
                        // },));

                      }, icon: Icon(Icons.delete)),
                    ]),
                  ),
                );
              },),
            )),
            Expanded(child: InkWell(onTap: () {
              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  title: Container(
                    height: 50,
                    width: double.infinity,
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(5),
                    color: Colors.deepPurple,
                    child: Text("Add Your Trip Members",style: TextStyle(color: Colors.white),),
                  ),
                  actions: [
                    TextField(
                      controller: t2,
                    ),
                    SizedBox(height: 5,),
                    Row(children: [
                      Expanded(child: InkWell(onTap: () {
                        Navigator.pop(context);
                      },
                        child: Container(
                          height: 40,
                          width: double.infinity,
                          color: Colors.purple,
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(5),
                          child: Text("Cancel",style: TextStyle(color: Colors.white,fontSize: 15),),
                        ),
                      )),
                      Expanded(child: InkWell(onTap:  () {
                        String name=t2.text;

                        String sql="insert into memberdata values(null, ${widget.l['id']},'$name')";
                        names_add.database!.rawInsert(sql);
                        print(sql);
                        Navigator.pop(context);
                        setState(() {
                        });
                      },
                        child: Container(
                          height: 40,
                          width: double.infinity,
                          color: Colors.purple,
                          alignment: Alignment.center,
                          child: Text("Add",style: TextStyle(color: Colors.white,fontSize: 15),),
                        ),
                      ))
                    ],)
                  ],
                );
              },);
            },
              child: Container(
                height: 60,
                width: 60,
                margin: EdgeInsets.only(left: 10),
                color: Colors.black,
                alignment: Alignment.center,
                child: Text("[+]",style: TextStyle(color: Colors.white,fontSize: 20),),
              ),
            ))
          ],
        );
      },)
    );
  }
}
