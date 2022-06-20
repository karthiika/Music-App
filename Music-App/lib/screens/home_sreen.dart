import 'dart:math';

import 'package:flutter/material.dart';
import 'package:musicplayer/screens/mymusic_sreen.dart';
import 'package:musicplayer/style/app_colors.dart';

import 'music_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Image> images = [
    Image.asset('assets/image/1.jpg'),
    Image.asset('assets/image/2.jpg'),
    Image.asset('assets/image/3.jpg'),
    Image.asset('assets/image/4.jpg'),
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar( backgroundColor: Colors.transparent,
        actions: [IconButton(icon: const Icon(Icons.notifications_active), color:Colors.white,onPressed: () {  },alignment:Alignment.bottomRight, )]),
      body:Column(
      children:[
      Padding(padding: EdgeInsets.all(20.0),
        child: Container(width: 450,height: 150,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
          topRight: Radius.circular(40.0),
              bottomRight: Radius.circular(40.0),
           topLeft: Radius.circular(40.0),
          bottomLeft: Radius.circular(40.0)),
          image: DecorationImage(image: AssetImage('assets/image/1.jpg'),fit: BoxFit.cover
          )
        ),
        ),
      ),
        const SizedBox(height: 5.0,),
        const SizedBox(width: 20.0,),
        Row(children: [Text('Top Picks For You',style: TextStyle(fontSize: 18,color: accentLight,fontWeight: FontWeight.bold)),
          SizedBox(height: 5.0,)],
        ),
        Flexible (
          flex: 1,
            child: ListView(
              scrollDirection: Axis.horizontal, children:List.generate(5, (index) => Column(
              children:List.generate(1, (index) =>
                  Column(children:[InkWell(
                    onTap: (){
                     Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyMusic()),
                      );
                    },
                    child: Container(
               height: 100,
               margin: const EdgeInsets.only(
                top: 8, bottom: 8, right: 12),
                 width: 150,
                decoration: BoxDecoration(
                 image: DecorationImage(
                       image: images[Random().nextInt(images.length)].image,
                         fit: BoxFit.cover),
                         color: Colors.red,
                         boxShadow: [
                         BoxShadow(
                          color:
                         Colors.black.withOpacity(0.1),
                         blurRadius: 2,
                          spreadRadius: 1)
                          ],
                          borderRadius: BorderRadius.circular(4)),

    ),
                  ),
    Text('Love Songs',style: TextStyle(fontSize: 10,color: accentLight,fontWeight: FontWeight.bold)),
    ]),
    ))
    ))
    ),
        Row(children: [Text('Recently Played',style: TextStyle(fontSize: 18,color: accentLight,fontWeight: FontWeight.bold)),
          SizedBox(height: 5.0,)],
        ),
          Container(
          child: Flexible (
              flex: 1,
              child: ListView(
                  padding: EdgeInsets.all(0),
                  scrollDirection: Axis.horizontal, children:List.generate(5, (index) => Column(
                  children:List.generate(1, (index) =>
                      Column(children:[InkWell(

                        child: Container(
                          height: 100,
                          margin: EdgeInsets.all(20.0),
                          width: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: images[Random().nextInt(images.length)].image,
                                  fit: BoxFit.cover),
                              color: Colors.red,
                              boxShadow: [
                                BoxShadow(
                                    color:
                                    Colors.black.withOpacity(0.1),
                                    blurRadius: 2,
                                    spreadRadius: 1)
                              ],
                              borderRadius: BorderRadius.circular(200)),

                        ),
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MusicScreen()),
                          );
                        },

                      ),
                        Text('Love Songs',style: TextStyle(fontSize: 10,color: accentLight,fontWeight: FontWeight.bold)),
                      ],

                )
                  )
              )
              )
          )
      ),
    ),
      ],),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note_outlined),
            label: 'My Music',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),


    );

  }
}

