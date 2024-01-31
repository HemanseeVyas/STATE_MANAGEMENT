import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:on_audio_room/details/rooms/favorites/favorites_entity.dart';


import '3controlerclass.dart';

class fav_fullscreens extends StatelessWidget {
  const fav_fullscreens({super.key});

  @override
  Widget build(BuildContext context) {
    controlers c=Get.put(controlers());
    return Scaffold(
    appBar: AppBar(),
      body: FutureBuilder(future: c.get_fav(),builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.done)
          {
            List<FavoritesEntity> list=snapshot.data as List<FavoritesEntity>;
            return ListView.builder(itemCount: list.length,
              itemBuilder: (context, index) {
              return ListTile(
                onTap: () {

                 for(int i=0;i<c.song_list.value.length;i++)
                   {
                     if(c.song_list.value[i].id==list[index].id)
                       {
                         if(i==c.cur_ind.value)
                           {

                           }
                         else
                           {
                                c.cur_ind.value=i;
                                controlers.player.play(DeviceFileSource(c.song_list.value[c.cur_ind.value].data));
                           }
                       }
                   }
                },
                title: Text("${list[index].title}"),
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
