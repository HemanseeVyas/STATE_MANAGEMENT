import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:on_audio_room/on_audio_room.dart';
import 'package:pdf_create/Music/3controlerclass.dart';

class song_list extends StatefulWidget {
  const song_list({super.key});

  @override
  State<song_list> createState() => _song_listState();
}

class _song_listState extends State<song_list> {

  @override
  Widget build(BuildContext context) {
    controlers c=Get.put(controlers());
    double screen_hieght = MediaQuery.of(context).size.height;
    double status_bar = MediaQuery.of(context).padding.top;
    double appbar_hieght = kToolbarHeight;
    return Scaffold(
      //18
      body: FutureBuilder(future: c.get_song(),builder: (context, snapshot) {

        if(snapshot.connectionState==ConnectionState.done)
          {
            List<SongModel>l=snapshot.data as List<SongModel>;

            return ListView.builder(itemCount: l.length,
              itemBuilder: (context, index) {
              return Card(
                //song listtile ma print and song lavva mate
                child: ListTile(
                  onTap: () {

                    showModalBottomSheet(isScrollControlled: true,
                      context: context, builder: (context) {
                        return Container(
                          height: screen_hieght-appbar_hieght,
                          color: Colors.black87,
                          child: Column(children: [
                            Expanded(flex: 6,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(40, 10, 40, 10),
                                height: 100,
                                width: double.infinity,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey,),
                                child: IconButton(onPressed: () {

                                }, icon: Icon(Icons.music_note_sharp,size: 200,)),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Expanded(child: Text("")),
                            Expanded(child: Container(
                              child: SliderTheme(data: SliderTheme.of(context).copyWith(
                                activeTrackColor: Colors.red,
                                trackHeight: 2,
                              ), child: Obx(() => Slider(
                                min: 0,
                                max: c.song_list.value.length>0 ? c.song_list.value[c.cur_ind.value].duration!.toDouble() : 0,
                                value: c.duration.value, onChanged: (value) {

                              },))),
                            )),
                            Expanded(child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(left: 5),
                              // color: Colors.white,
                              child: Obx(() => Text("${c.song_list.value[c.cur_ind.value].title}",style: TextStyle(color: Colors.white,fontSize: 15),)),
                            )),
                            SizedBox(height: 10,),
                            Expanded(flex: 3,
                              child: Container(
                                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      Expanded(child: Container(
                                        // margin: EdgeInsets.only(left: 40),
                                        child:IconButton(onPressed: () {
                                          if(c.cur_ind>0)
                                            {
                                                    c.cur_ind--;
                                                    c.isplay.value=true;
                                                    controlers.player.play(
                                                      //cur_ind var in page d2
                                                        DeviceFileSource(c.song_list.value[c.cur_ind.value].data)
                                                    );
                                            }

                                        }, icon: Icon(Icons.skip_previous,size: 60,),color: Colors.red,),
                                      )),
                                      Expanded(
                                        child: Container(
                                          child: Obx(() => c.isplay.value ? IconButton(onPressed: () {
                                            controlers.player.pause();
                                            c.isplay.value=!c.isplay.value;
                                          }, icon: Icon(Icons.pause,size: 50,color: Colors.red,)) : IconButton(onPressed: () {
                                            c.isplay.value=!c.isplay.value;
                                            controlers.player.play(
                                              //cur_ind var in page d2
                                                DeviceFileSource(c.song_list.value[c.cur_ind.value].data)
                                            );
                                          }, icon: Icon(Icons.play_arrow,size: 50,color: Colors.red,))),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: IconButton(onPressed: () {
                                            if(c.cur_ind<c.song_list.length-1)
                                            {
                                              c.cur_ind++;
                                              c.isplay.value=true;
                                              controlers.player.play(
                                                //cur_ind var in page d2
                                                  DeviceFileSource(c.song_list.value[c.cur_ind.value].data)
                                              );
                                            }

                                          }, icon: Icon(Icons.skip_next,size: 60,),color: Colors.red,),
                                        ),
                                      )
                                    ]),
                              ),
                            ),
                            Expanded(child: Text("")),
                            Expanded(flex: 2,
                                child: Container(
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        IconButton(onPressed: ()  {

                                        }, icon: Icon(Icons.menu,color: Colors.white,)),
                                      Obx(() =>
                                            c.fav.value ?
                                                IconButton(onPressed: () async {
                                                  bool deleteFromResult=await OnAudioRoom().deleteFrom(RoomType.FAVORITES, c.song_list.value[c.cur_ind.value].id);
                                                  c.get_check();

                                                }, icon: Icon(Icons.favorite,color: Colors.white,))
                                                :IconButton(onPressed: () async {
                                                int? addToResult = await OnAudioRoom().addTo(
                                                  RoomType.FAVORITES,
                                                  c.song_list.value[c.cur_ind.value].getMap.toFavoritesEntity());
                                                  c.get_check();
                                                }, icon: Icon(Icons.favorite_border,color: Colors.white,))
                                      ),
                                        IconButton(onPressed: () {

                                        }, icon: Icon(Icons.autorenew_sharp,color: Colors.white,)),
                                        IconButton(onPressed: () {

                                        }, icon: Icon(Icons.more_horiz,color: Colors.white,)),
                                      ]),))
                          ]),
                        );
                      },);
                    c.get_duration();
                    c.isplay.value=true;
                    if(c.cur_ind.value==index)
                      {

                      }
                    else
                      {
                        c.cur_ind.value=index;
                        controlers.player.play(
                          DeviceFileSource(c.song_list.value[c.cur_ind.value].data)
                        );
                      }
                  },
                  title: Text("${l[index].title}"),
                  subtitle: Text("${l[index].artist}"),
                  // trailing: ,
                ),
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


