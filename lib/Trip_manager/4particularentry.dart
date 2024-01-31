import 'package:flutter/material.dart';

class particulardatas extends StatefulWidget {
  Map l;
  particulardatas(this.l);

  @override
  State<particulardatas> createState() => _particulardatasState();
}

class _particulardatasState extends State<particulardatas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text("${widget.l['name']}"),
    ),
    );
  }
}
