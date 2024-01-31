import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:on_audio_room/details/rooms/favorites/favorites_entity.dart';
import 'package:pdf_create/Music/3controlerclass.dart';
import 'package:pdf_create/Music/9fullscreen.dart';

class plat_list extends StatefulWidget {
  const plat_list({super.key});

  @override
  State<plat_list> createState() => _plat_listState();
}

class _plat_listState extends State<plat_list> {
  @override
  Widget build(BuildContext context) {
    controlers c = Get.put(controlers());
    return Scaffold(
      body: FutureBuilder(
        future: c.get_fav(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<FavoritesEntity> list = snapshot.data as List<FavoritesEntity>;
            return ListTile(
              onTap: () {
                // page in 9fullscreen
                // c.get_check();
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return fav_fullscreens();
                  },
                ));
              },
              title: Text("Song"),
              subtitle: Text("${list.length}"),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
