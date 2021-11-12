import 'package:flutter/material.dart';
import 'package:movie_db/data/model/TVShowListModel.dart';
import 'package:movie_db/ui/tvshows/ItemTVShowView.dart';




class TVShowVerticalListView extends StatelessWidget {
  final AsyncSnapshot<TVShowListModel> listItems;

  const TVShowVerticalListView({Key key, this.listItems}) : super(key: key);

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
      return Container(
        height: 300,
        color: Colors.transparent,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }

  Widget _buildListView(BuildContext context, TVShowListModel movies) {
    return Expanded(
      child: Container(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: movies.results.length,
          itemBuilder: (BuildContext context, int index) {
            return buildItemMovieView(context, movies.results[index]);
          },
        ),
      ),
    );
  }
}
