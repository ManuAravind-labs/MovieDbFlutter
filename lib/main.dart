import 'package:flutter/material.dart';
import 'package:movie_db/ui/HomeScreen.dart';
import 'package:movie_db/ui/SplashScreen.dart';
import 'package:movie_db/ui/movies/MovieScreen.dart';
import 'package:movie_db/ui/people/PeopleScreen.dart';
import 'package:movie_db/ui/tvshows/TVShowScreen.dart';

import 'constant/Constant.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        HOME_SCREEN: (BuildContext context) => HomeScreen(),
        ANIMATED_SPLASH: (BuildContext context) => SplashScreen(),
        MOVIE_CONTAINER_SCREEN: (BuildContext context) => MovieScreen(),
        TVSHOW_CONTAINER_SCREEN: (BuildContext context) => TVShowScreen(),
        PEOPLE_CONTAINER_SCREEN: (BuildContext context) => PeopleScreen(),

    //    PEOPLE_CONTAINER_SCREEN: (BuildContext context) => PeopleScreen(),
      },
    );
  }
}

