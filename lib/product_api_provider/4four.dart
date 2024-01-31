import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:getwidget/components/rating/gf_rating.dart';
import 'package:provider/provider.dart';

import '2second.dart';
import '3third.dart';

class show_data extends StatelessWidget {
  // const show_data({super.key});

  @override
  Widget build(BuildContext context) {

    double _rating = 3;
    product p = ModalRoute.of(context)!.settings.arguments as product;
    List<String>? mm=p.images;
    print("Images = ${p.images}");
    final List<String> imageList = [
      "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
      "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
      "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
      "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
      "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
      "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
    ];
    // List
    return ChangeNotifierProvider(
      create: (context) => logic_fun(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("${p.title}"),
          backgroundColor: Colors.blueGrey,
        ),
        body:  Consumer<logic_fun>(
          builder: (context, l1, child) {
            return FutureProvider(
              create: (context) => l1.getData_show("${p.id}"),
              initialData: l1.getData_show("${p.id}"),
              builder: (context, child) {
                // print("${l1.m['products']}");
                List? l = l1.m['products'] as List?;
                // print("${l}");
                // if(l!=null)
                // {
                return Column(
                  children: [
                    Expanded(flex: 2,child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 30),
                      child: Text("${p.title}",style: TextStyle(fontSize:25),),
                    )),
                    Expanded(flex: 4,
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Image.network("${p.thumbnail}"),
                        )),
                    GFCarousel(
                      items: mm!.map(
                            (url) {
                          return Container(
                            margin: EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              child: Image.network(
                                  url,
                                  fit: BoxFit.cover,
                                  width: 1000.0,
                                height: 20,
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                    Expanded(child: Container(
                      alignment: Alignment.center,
                      child: Text("${p.description}"),
                    )),
                    Expanded(child: Container(
                      child: GFRating(
                        value: _rating,
                        onChanged: (value) {
                          _rating = value;
                        },
                      ),
                    )),
                    Expanded(child: Container(
                      child: Text(" Price - ${p.price} ₹"),
                    )),
                    Expanded(child: Container(
                      child: Text(" Brand - ${p.brand} "),
                    )),
                  ],
                );
                }
            );
          },
        )
      ),
    );
  }
}