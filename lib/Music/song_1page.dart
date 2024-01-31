import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: song(),));
}
class song extends StatelessWidget {
  const song({super.key});

  @override
  Widget build(BuildContext context) {
    double screen_hieght = MediaQuery.of(context).size.height;
    double status_bar = MediaQuery.of(context).padding.top;
    double appbar_hieght = kToolbarHeight;
    return DefaultTabController(length: 4,
        child: Scaffold(
          appBar: AppBar(title: Text("Music"),
            actions: [
              IconButton(onPressed: () {

              }, icon: Icon(Icons.search,color: Colors.red,)),
              PopupMenuButton(color: Colors.red,
                  onCanceled: () {
                    // print("Testing");
                  },
                  onSelected: (value) {
                    if(value==1)
                    {
                      print("Song");
                    }else if(value==2)
                    {
                      print("Artist");
                    }else if(value==3)
                    {
                      print("Albums");
                    }
                  },
                  itemBuilder: (context) =>
                  [
                    PopupMenuItem(value: 1,child: Text("Song")),
                    PopupMenuItem(value: 2,child: Text("Artist")),
                    PopupMenuItem(value: 3,child: Text("Albums")),
                  ]
              ),
            ],
            backgroundColor: Colors.black,
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
                    child: Text("Song",style: TextStyle(fontSize: 20),),
                  ), Tab(
                    child: Text("Artist",style: TextStyle(fontSize: 20),),
                  ),Tab(
                    child: Text("Albums",style: TextStyle(fontSize: 20),),
                  ),Tab(
                    child: Text("Plyalists",style: TextStyle(fontSize: 20),),
                  ),
                  // Tab(
                  //   child: Text("five"),
                  // ),Tab(
                  //   child: Text("six"),
                  // ),Tab(
                  //   child: Text("seven"),
                  // ),
                  // Tab(
                  //   child: Text("eight"),
                  // ),
                  // Tab(
                  //   child: Text("nine"),
                  // )
                ]),
          ),
          backgroundColor: Colors.black,
          body: Column(children: [
                  InkWell(onTap: () {
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
                              child: Slider(
                                activeColor: Colors.red,
                                inactiveColor: Colors.black,
                                max: 100,
                                min: 0,
                                value: 10,
                                onChanged: (value) {

                                },
                              ),
                          )),
                          Expanded(child: Container(
                            alignment: Alignment.center,
                            // color: Colors.white,
                            child: Text("AUD-2023080......",style: TextStyle(color: Colors.white,fontSize: 20),),
                          )),
                          SizedBox(height: 10,),
                          Expanded(flex: 3,
                            child: Container(
                              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                             Expanded(child: Container(
                               // margin: EdgeInsets.only(left: 40),
                               child:IconButton(onPressed: () {

                                 }, icon: Icon(Icons.arrow_right_outlined,size: 60,),color: Colors.red,),
                             )),
                               Expanded(
                                 child: Container(
                                   child: IconButton(onPressed: () {

                                   }, icon: Icon(Icons.play_circle,size: 80,),color: Colors.red,),
                                 ),
                               ),
                                Expanded(
                                  child: Container(
                                    child: IconButton(onPressed: () {

                                    }, icon: Icon(Icons.arrow_left,size: 60,),color: Colors.red,),
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
                              IconButton(onPressed: () {

                              }, icon: Icon(Icons.menu,color: Colors.white,)),
                              IconButton(onPressed: () {

                              }, icon: Icon(Icons.favorite_border,color: Colors.white,)),
                              IconButton(onPressed: () {

                              }, icon: Icon(Icons.autorenew_sharp,color: Colors.white,)),
                              IconButton(onPressed: () {

                              }, icon: Icon(Icons.more_horiz,color: Colors.white,)),
                            ]),))
                        ]),
                      );
                    },);
                  },
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 50,
                      width: double.infinity,
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: Text("Songs"),
                    ),
                  )
          ]),
        ));
  }
}
