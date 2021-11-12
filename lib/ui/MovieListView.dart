import 'package:flutter/material.dart';
import 'package:movie_db/data/model/MovieListModel.dart';
import 'package:movie_db/ui/MovieItemView.dart';


class MovieListView extends StatelessWidget {
  final AsyncSnapshot<MovieListModel> listItems;

  const MovieListView({Key key, this.listItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Populate list view with the data
    if (listItems.hasData) {
      return _buildListView(context, listItems.data);
    }
    // Display loading indicator
    else if(listItems.hasError)  {
      return Center(child: Text(listItems.error.toString()));
    }
    else{
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    // Display shimmer loading view

  }

  Widget _buildListView(BuildContext context, MovieListModel movies) {
    final rootWidth = MediaQuery.of(context).size.width;
    return Container(
      height: rootWidth / 2.00,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.results.length,
        itemBuilder: (BuildContext context, int index) {
          return buildMovieItemView(context, movies.results[index]);
        },
      ),
    );


    //https://github.com/joshuadeguzman/flutter_moviehub
    //https://github.com/mohak1283/Flutter-Movies
  }




}
