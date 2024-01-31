import 'dart:io';
import 'dart:math';

import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: pdfs(),
  ));
}

class pdfs extends StatefulWidget {
  const pdfs({super.key});

  @override
  State<pdfs> createState() => _pdfsState();
}

class _pdfsState extends State<pdfs> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }

  get() async {
    // 6
    var status = await Permission.storage.status;
    if (status.isDenied) {
      // We haven't asked for permission yet or the permission has been denied before, but not permanently.
      //7

      Map<Permission, PermissionStatus> statuses = await [
        Permission.location,
        Permission.storage,
      ].request();
      print(statuses[Permission.location]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("PDF_CREATE"),
        ),
        body: ElevatedButton(
            onPressed: () async {
              //1 pdf in flutter ->g.s
              //2> pdf in object
              final PdfDocument document = PdfDocument();
              final PdfPage page = document.pages.add(); //3 new page add krva
              page.graphics.drawString(
                  "Hello", PdfStandardFont(PdfFontFamily.helvetica, 15),
                  brush: PdfSolidBrush(PdfColor(0, 0, 0)), // 4 color apva
                  bounds: const Rect.fromLTWH(
                      0, 0, 150, 20)); //5 page ma gme tya size leva mte

              //8
              var path = await ExternalPath.getExternalStoragePublicDirectory(
                      ExternalPath.DIRECTORY_DOWNLOADS) +
                  "/pdf";
              print(path);

              //9
              Directory dir = Directory(path);
              //10
              if (!await dir.exists()) {
                dir.create();
              }
              //11 all
              File f = File("${dir.path}/mypdf${Random().nextInt(100)}.pdf");
              f.writeAsBytes(await document.save());
              //open_file_pluss - g.s
              OpenFile.open(f.path);
              document.dispose();
              setState(() {});
            },
            child: Text("Submit")));
  }
}
