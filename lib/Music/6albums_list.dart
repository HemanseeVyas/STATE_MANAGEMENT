import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:on_audio_query/on_audio_query.dart';


import '3controlerclass.dart';
import '8album_pages.dart';

class album_list extends StatefulWidget {
  const album_list({super.key});

  @override
  State<album_list> createState() => _album_listState();
}

class _album_listState extends State<album_list> {
  @override
  Widget build(BuildContext context) {
    controlers c=Get.put(controlers());
    return Scaffold(
      body: FutureBuilder(future: c.get_album(),builder: (context, snapshot) {

        if(snapshot.connectionState==ConnectionState.done)
          {
            List<AlbumModel> l=snapshot.data as List<AlbumModel>;
            return ListView.builder(
              itemCount: l.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                     return getallalbums(l[index]);
                      },));
                    },
                    title: Text("${l[index].album}"),),
                );
              },);

          }
        else
          {
            return CircularProgressIndicator();
          }
      },),
    );
  }
}
