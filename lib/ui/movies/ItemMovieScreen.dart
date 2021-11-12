import 'package:flutter/material.dart';
import 'package:movie_db/data/model/MovieListModel.dart';
import 'package:movie_db/data/remote/HomeBloc.dart';
import 'package:movie_db/ui/movies/MovieVerticalListView.dart';
import 'package:rxdart/rxdart.dart';

class ItemMovieScreen extends StatefulWidget {
  final String type;
  const ItemMovieScreen({Key key, this.type}) : super(key: key);
  @override
  _ItemMovieScreenState createState() => _ItemMovieScreenState();
}

class _ItemMovieScreenState extends State<ItemMovieScreen> {

  HomeBloc bloc;

  @override
  void initState() {
    bloc = HomeBloc();
    if(widget.type=="0") {
      bloc.getPopularMovies();
    }else  if(widget.type=="1") {
      bloc.getTopRatedMovies();
    }
    else  if(widget.type=="2") {
      bloc.getUpcomingMovies();
    }
    else  if(widget.type=="3") {
      bloc.getNowPlayingMovies();
    }
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildPopularListView();
  }

  Widget _buildPopularListView() {
    return Container(
      child: Column(
        children: <Widget>[
          StreamBuilder(
            stream: getData(),
            builder: (context, AsyncSnapshot<MovieListModel> snapshot) {
              return MovieVerticalListView(listItems: snapshot);
            },
          ),
        ],
      ),
    );
  }

  Observable<MovieListModel> getData(){
    if(widget.type=="0") {
      return  bloc.popularMoviesList;
    }else  if(widget.type=="1") {
      return  bloc.topRatedMoviesList;
    }
    else  if(widget.type=="2") {
      return  bloc.upcomingMoviesList;
    }
    else {
      return  bloc.nowPlayingMoviesList;
    }
  }

}
