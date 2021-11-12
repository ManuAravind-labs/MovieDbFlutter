import 'package:flutter/material.dart';
import 'package:movie_db/ui/generic/AppDrawer.dart';
import 'package:movie_db/ui/tvshows/ItemTVShowScreen.dart';

class TVShowScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(title: Text("TV Shows",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),),
            bottom: TabBar(
                labelColor: Colors.pink,
                unselectedLabelColor: Colors.white,
                indicator: BoxDecoration(
                    gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Colors.white,  Colors.white]),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    color: Colors.white),
                tabs: [
                  Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Popular",
                          style: TextStyle(
                            fontSize: 11.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      )),
                  Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("TopRated",
                          style: TextStyle(
                            fontSize: 11.0,
                            fontWeight: FontWeight.normal,
                          ),),
                      )),

                  Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("On Air",
                          style: TextStyle(
                            fontSize: 11.0,
                            fontWeight: FontWeight.normal,
                          ),),
                      )),
                  Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Airing",
                          style: TextStyle(
                            fontSize: 11.0,
                            fontWeight: FontWeight.normal,
                          ),),
                      ))
                ]),



          ),
          body: TabBarView(
            children: <Widget>[
              ItemTVShowScreen(type:"0"),
              ItemTVShowScreen(type:"1"),
              ItemTVShowScreen(type:"2"),
              ItemTVShowScreen(type:"3"),
            ],
          )
      ),
    );
  }

}