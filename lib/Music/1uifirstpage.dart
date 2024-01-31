import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_room/on_audio_room.dart';
import 'package:pdf_create/Music/2mainpage.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> main()
async {
  await OnAudioRoom().initRoom(RoomType.FAVORITES);
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: timepg(),));
}
class timepg extends StatefulWidget {
  const timepg({super.key});

  @override
  State<timepg> createState() => _timepgState();
}

class _timepgState extends State<timepg> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    permissions();

    //1
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return fist();
      },));

    });
  }

  //2
  //3 - storage file & audio,video,images file in android-app-src-min-manifets
  //4 second class in d2 file
  permissions()
  async {
      //permission handler
    var status = await Permission.storage.status;
    if (status.isDenied) {
      // We haven't asked for permission yet or the permission has been denied before, but not permanently.
      Map<Permission, PermissionStatus> statuses = await [
        Permission.location,
        Permission.storage,
      ].request();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music..."),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        margin: EdgeInsets.all(10),
        color: Colors.deepPurple,
        child: Text("  Msuic\nplayerss...",style: TextStyle(color: Colors.white,fontSize: 20),),
      ),
    );
  }
}
