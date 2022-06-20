import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musicplayer/screens/music_screen.dart';

import '../style/app_colors.dart';

class MyMusic extends StatefulWidget {


  @override
  State<MyMusic> createState() => _MyMusicState();
}

class _MyMusicState extends State<MyMusic> {
   late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: Colors.transparent,title: Text('Local Songs',style: TextStyle(fontSize: 20,color: accentLight,fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: [
          Expanded(
          child:ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index)=>
              Column(
                children: [
                  listSectionMethod("Bae Don", "Anirudh Ravichandran",context),
                  listSectionMethod("Arabic Kuthu", "Anirudh Ravichandran",context),
                  listSectionMethod("Kodi Aruvi", "Pradeep Kumar",context),
                  listSectionMethod("Malai Kuruvi ", "Anirudh Ravichandran",context),
                  listSectionMethod("Kadhale Kadhale", "Hip Hop Tamizha",context),
                  listSectionMethod("Private Party", "Anirudh Ravichandran",context),
                  listSectionMethod("Rowdy Baby", "Yuvan Shankar Raja",context),
                  listSectionMethod("High On Love", "Yuvan Shakar Raja",context),
                  listSectionMethod("Private Party", "Anirudh Ravichandran",context),

                ],
              ),
            ),
          ),
    ])
      );

  }
}

Card listSectionMethod(String title, String subtitle, BuildContext context) {
  List<Image> images = [
    Image.asset('assets/image/1.jpg'),
    Image.asset('assets/image/2.jpg'),
    Image.asset('assets/image/3.jpg'),
    Image.asset('assets/image/4.jpg'),

  ];
  return Card(
    child:
    InkWell(
      onTap: (){

      },
      child: Container
        (
         width: 500,
          height: 70,
          child:ListTile(
           // tileColor: Colors.transparent,
            onTap: () {
               },
            leading:CircleAvatar(
            backgroundImage: images[Random().nextInt(images.length)].image,
            ),
            title: Text(title,style: const TextStyle(fontSize: 13,color: Colors.black,fontWeight: FontWeight.bold)),
            subtitle: Text(subtitle,style: const TextStyle(fontSize: 10,color: Colors.black54,fontWeight: FontWeight.normal)),
            trailing: IconButton(icon: const Icon(Icons.play_circle,color: Colors.black,),
            onPressed: () {


            }
        ),
      )),
    ),
  );
}