import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf_create/Music/3controlerclass.dart';
import 'package:pdf_create/Music/4Songs_list.dart';
import 'package:pdf_create/Music/7plyas_list.dart';

import '6albums_list.dart';
import '5artists_list.dart';

class fist extends StatefulWidget {
  const fist({super.key});

  @override
  State<fist> createState() => _fistState();
}

class _fistState extends State<fist> {
  @override
  Widget build(BuildContext context) {
    //15
    controlers c = Get.put(controlers());
    //10
    return DefaultTabController(
      length: 4,
      child: WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text("Music"),
            bottom: TabBar(
                isScrollable: true,
                indicatorColor: Colors.red,
                dividerColor: Colors.white,
                // indicator: BoxDecoration(color: Colors.blueGrey,
                //     borderRadius: BorderRadius.circular(10)),
                unselectedLabelColor: Colors.white,
                labelColor: Colors.red,
                tabs: [
                  Tab(
                    child: Text(
                      "Song",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Artist",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Albums",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Plyalists",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ]),
          ),

          //11
          //12 in d2 page == 16
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.yellow,
                    trackHeight: 2,
                  ),
                  child: Obx(() => Slider(
                        min: 0,
                        max: c.song_list.value.length > 0
                            ? c.song_list.value[c.cur_ind.value].duration!
                                .toDouble()
                            : 0,
                        value: c.duration.value,
                        onChanged: (value) {},
                      ))),

              //17
              ListTile(
                  title: Obx(() => c.song_list.value.isNotEmpty
                      ? Text("${c.song_list.value[c.cur_ind.value].title}")
                      : Text("data")),
                  //isplay var in page d2
                  trailing: Wrap(
                    children: [
                      Obx(() => c.isplay.value
                          ? IconButton(
                              onPressed: () {
                                controlers.player.pause();
                                c.isplay.value = !c.isplay.value;
                              },
                              icon: Icon(Icons.pause))
                          : IconButton(
                              onPressed: () {
                                c.isplay.value = !c.isplay.value;
                                controlers.player.play(
                                    //cur_ind var in page d2
                                    DeviceFileSource(c.song_list
                                        .value[c.cur_ind.value].data));
                              },
                              icon: Icon(Icons.play_arrow))),
                    ],
                  )),

              // 18- d4 in page(song list)
            ],
          ),
          body: TabBarView(
            children: [
              song_list(),
              artist_list(),
              album_list(),
              plat_list(),
            ],
          ),
        ),
        onWillPop: () async {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("you can exit now"),
                actions: [
                  TextButton(onPressed: () {
                    Navigator.pop(context);
                  }, child: Text("OK"))
                ],
              );
            },
          );
          return true;
        },
      ),
    );
  }
}
