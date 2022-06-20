import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer/screens/home_sreen.dart';
import 'package:musicplayer/style/app_colors.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: accent,
          scaffoldBackgroundColor: bgColor,
          canvasColor: bgColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.ubuntuTextTheme(Theme.of(context).textTheme),
          pageTransitionsTheme: PageTransitionsTheme(builders: {TargetPlatform.android: ZoomPageTransitionsBuilder(),
          })),
      home: HomeScreen());
  }
}

