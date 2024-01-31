import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:pdf_create/Trip_manager/3addtourdetails.dart';
import 'package:sqflite/sqflite.dart';

class names_add extends StatefulWidget {
  const names_add({super.key});

  static Database ? database;

  @override
  State<names_add> createState() => _names_addState();
}

class _names_addState extends State<names_add> {

  TextEditingController t1=TextEditingController();
  TextEditingController t3=TextEditingController();
  List<Map> l=[];
  List<Map> l1=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    trip_datass();
  }
  trip_datass()
  async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'hvm.db');


// open the database
     names_add.database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
              'CREATE TABLE tripdatas (id INTEGER PRIMARY KEY, name TEXT)');

          await db.execute(
              'CREATE TABLE memberdata (id INTEGER PRIMARY KEY,mb INTEGER, name TEXT)');

          await db.execute(
              'CREATE TABLE date_add (id INTEGER PRIMARY KEY, date TEXT)');
        });

    String sql="select * from tripdatas";
    l= await names_add.database!.rawQuery(sql);

    String sql1="select * from date_add";
    l1= await names_add.database!.rawQuery(sql1);
    setState(() {
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("Trips_Adds...."),),
      body:
    FutureBuilder(future: trip_datass(),builder: (context, snapshot) {
        return
        Column(
          children: [
            Expanded(child: Container(
              child: ListView.builder(
                itemCount: l.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return details_add(l[index]);
                        },));
                      },
                      title: Text("${l[index]['name']}"),
                      trailing: Wrap(children: [
                        IconButton(onPressed: () {
                            showDialog(context: context, builder: (context) {
                              return AlertDialog(
                                alignment: Alignment.center,
                                title: Container(
                                  height: 40,
                                  width: double.infinity,
                                  color: Colors.purple,
                                  alignment: Alignment.center,
                                  child: Text("Add Date",style: TextStyle(color: Colors.white,fontSize: 15),),
                                ),
                                actions: [
                                  TextField(controller: t3,),
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
                                      Navigator.pop(context);
                                      String date=t3.text;

                                      String sql1="insert into date_add values(null, '$date')";
                                      names_add.database!.rawInsert(sql1);
                                      print(sql1);
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
                        }, icon: Icon(Icons.date_range_rounded))
                      ]),
                    ),
                  );
                },),
            )),
            InkWell(onTap: () {
              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  title: Container(
                    height: 50,
                    width: double.infinity,
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(5),
                    color: Colors.deepPurple,
                    child: Text("Add Your Trip Place",style: TextStyle(color: Colors.white),),
                  ),
                  actions: [
                    TextField(
                      controller: t1,
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
                        Navigator.pop(context);
                        String name=t1.text;

                        String sql="insert into tripdatas values(null, '$name')";
                        names_add.database!.rawInsert(sql);
                        print(sql);
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
            ),
          ],
        );
      },
      )
    );
  }
}
