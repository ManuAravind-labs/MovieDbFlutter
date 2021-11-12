import 'package:flutter/material.dart';
import 'package:movie_db/data/model/MovieDetailsModel.dart';
import 'package:movie_db/data/model/MovieModel.dart';
import 'package:movie_db/data/remote/HomeBloc.dart';
import 'package:movie_db/ui/details/DetailsMovieView.dart';
import 'package:rxdart/rxdart.dart';

class DetailsScreen extends StatefulWidget {
  MovieModel movieModel;

  DetailsScreen({Key key, @required this.movieModel}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  HomeBloc bloc;

  @override
  void initState() {
    bloc = HomeBloc();
    bloc.getMovieDetails(widget.movieModel.id.toString());
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: getData(),
      builder: (context, AsyncSnapshot<MovieDetailsModel> snapshot) {
        return DetailsMovieView(listItems: snapshot);
      },
    );
  }

  Observable<MovieDetailsModel> getData() {
    return bloc.movieDetails;
  }
}
