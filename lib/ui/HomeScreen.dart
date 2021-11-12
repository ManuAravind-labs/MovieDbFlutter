import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_db/data/model/MovieListModel.dart';
import 'package:movie_db/data/model/TVShowListModel.dart';
import 'package:movie_db/data/remote/HomeBloc.dart';
import 'package:movie_db/ui/SectionHeaderView.dart';
import 'package:movie_db/ui/TVShowListView.dart';
import 'package:movie_db/ui/generic/AppDrawer.dart';

import 'MovieListView.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc bloc;

  @override
  void initState() {
    bloc = HomeBloc();
    bloc.getUpcomingMovies();
    bloc.getTopRatedMovies();
    bloc.getPopularMovies();
    bloc.getNowPlayingMovies();

    bloc.getPopularTVShows();
    bloc.getTopRatedTVShows();
    bloc.getOnAirTVShows();
    bloc.getAiringTodayTVShows();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),),

        ),
        drawer: AppDrawer(),
        body: _buildBody());
  }

  Widget _buildBody() {
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              height: 60,
              color: Colors.black12,
              padding: EdgeInsets.only(left: 16, right: 10),
              child: Text(
                "Movies",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              color: Colors.white,
              elevation: 3,
              child:_buildPopularListView() ,
            ),
            Card(
              margin: EdgeInsets.only(left:10, right:10, bottom:10),
              color: Colors.white,
              elevation: 3,
              child:_buildTopRatedListView(),
            ),
            Card(
              margin: EdgeInsets.only(left:10, right:10, bottom:10),
              color: Colors.white,
              elevation: 3,
              child:_buildNowPlayingListView(),
            ),
            Card(
              margin: EdgeInsets.only(left:10, right:10, bottom:10),
              color: Colors.white,
              elevation: 3,
              child: _buildUpComingListView(),
            ),


            Container(
              alignment: Alignment.centerLeft,
              color: Colors.black12,
              height: 60,
              padding: EdgeInsets.only(left: 16, right: 10),
              child: Text(
                "TV Shows",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Card(
              margin: EdgeInsets.all(10),
              color: Colors.white,
              elevation: 3,
              child:  _buildPopularTVListView(),
            ),
            Card(
              margin: EdgeInsets.only(left:10, right:10, bottom:10),
              color: Colors.white,
              elevation: 3,
              child:_buildTopRatedTVListView(),
            ),
            Card(
              margin: EdgeInsets.only(left:10, right:10, bottom:10),
              color: Colors.white,
              elevation: 3,
              child: _buildOnAirTVListView(),
            ),
            Card(
              margin: EdgeInsets.only(left:10, right:10, bottom:10),
              color: Colors.white,
              elevation: 3,
              child:  _buildAiringTodayTVListView(),
            ),




          ],
        ),
      ),
    );
  }

  Widget _buildPopularListView() {
    return Container(
      height: 240,
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          buildSectionHeaderView('Popular'),
          StreamBuilder(
            stream: bloc.popularMoviesList,
            builder: (context, AsyncSnapshot<MovieListModel> snapshot) {
              return MovieListView(listItems: snapshot);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTopRatedListView() {
    return Container(
      height: 240,
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          buildSectionHeaderView('Top Rated'),
          StreamBuilder(
            stream: bloc.topRatedMoviesList,
            builder: (context, AsyncSnapshot<MovieListModel> snapshot) {
              return MovieListView(listItems: snapshot);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildUpComingListView() {
    return Container(
      height: 240,
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          buildSectionHeaderView('Up Coming'),
          StreamBuilder(
            stream: bloc.upcomingMoviesList,
            builder: (context, AsyncSnapshot<MovieListModel> snapshot) {
              return MovieListView(listItems: snapshot);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNowPlayingListView() {
    return Container(
      height: 240,
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          buildSectionHeaderView('Now Playing'),
          StreamBuilder(
            stream: bloc.nowPlayingMoviesList,
            builder: (context, AsyncSnapshot<MovieListModel> snapshot) {
              return MovieListView(listItems: snapshot);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPopularTVListView() {
    return Container(
      height: 240,
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          buildSectionHeaderView('Popular'),
          StreamBuilder(
            stream: bloc.popularTVList,
            builder: (context, AsyncSnapshot<TVShowListModel> snapshot) {
              return TVShowListView(listItems: snapshot);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTopRatedTVListView() {
    return Container(
      height: 240,
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          buildSectionHeaderView('Top Rated'),
          StreamBuilder(
            stream: bloc.topRatedTVList,
            builder: (context, AsyncSnapshot<TVShowListModel> snapshot) {
              return TVShowListView(listItems: snapshot);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAiringTodayTVListView() {
    return Container(
      height: 240,
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          buildSectionHeaderView('Up Coming'),
          StreamBuilder(
            stream: bloc.airingTodayTVList,
            builder: (context, AsyncSnapshot<TVShowListModel> snapshot) {
              return TVShowListView(listItems: snapshot);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildOnAirTVListView() {
    return Container(
      height: 240,
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          buildSectionHeaderView('Now Playing'),
          StreamBuilder(
            stream: bloc.onAirTVList,
            builder: (context, AsyncSnapshot<TVShowListModel> snapshot) {
              return TVShowListView(listItems: snapshot);
            },
          ),
        ],
      ),
    );
  }
}
