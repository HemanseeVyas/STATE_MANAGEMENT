import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:on_audio_query_platform_interface/src/models/album_model.dart';
import 'package:pdf_create/Music/3controlerclass.dart';

class getallalbums extends StatelessWidget {

  //6album_list page ma index pass krvvi
  AlbumModel l;
   getallalbums(this.l);

  @override
  Widget build(BuildContext context) {
    controlers c= Get.put(controlers());
    return  Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SliderTheme(data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.yellow,
            trackHeight: 2,
          ), child: Obx(() => Slider(
            min: 0,
            max: c.song_list.value.length>0 ? c.song_list.value[c.cur_ind.value].duration!.toDouble() : 0,
            value: c.duration.value, onChanged: (value) {

          },))),

          //17
          ListTile(
              title: Obx(() =>c.song_list.value.isNotEmpty? Text("${c.song_list.value[c.cur_ind.value].title}"):Text("data")),
              //isplay var in page d2
              trailing: Wrap(children: [
                Obx(() => c.isplay.value ? IconButton(onPressed: () {
                  controlers.player.pause();
                  c.isplay.value=!c.isplay.value;
                }, icon: Icon(Icons.pause)) : IconButton(onPressed: () {
                  c.isplay.value=!c.isplay.value;
                  controlers.player.play(
                    //cur_ind var in page d2
                      DeviceFileSource(c.song_list.value[c.cur_ind.value].data)
                  );
                }, icon: Icon(Icons.play_arrow))),
              ],)
          ),

          // 18- d4 in page(song list)
        ],

      ),
      body: FutureBuilder(future: c.getallsong(l.id),builder: (context, snapshot) {

        if(snapshot.connectionState==ConnectionState.done)
          {
            List <SongModel> l=snapshot.data as List <SongModel>;
            return ListView.builder(itemCount: l.length,
              itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  onTap: () {
                    c.isplay.value=true;

                    for(int i=0; i<c.song_list.value.length; i++)
                      {
                        if(c.song_list.value[i].id==l[index].id)
                          {
                              if(i==c.cur_ind.value)
                                {

                                }
                              else
                                {
                                  c.cur_ind.value=i;
                                  controlers.player.play(DeviceFileSource(
                                    c.song_list.value[c.cur_ind.value].data
                                  ));
                                }
                          }
                      }
                  },
                  title: Text("${l[index].title}"),
                ),
              );
            },);
          }else
            {
              return CircularProgressIndicator();
            }

      },),
    );
  }
}
