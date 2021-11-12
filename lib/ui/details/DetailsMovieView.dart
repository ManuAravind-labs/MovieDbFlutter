import 'package:flutter/material.dart';
import 'package:movie_db/data/model/MovieDetailsModel.dart';

class DetailsMovieView extends StatelessWidget {
  final AsyncSnapshot<MovieDetailsModel> listItems;

  const DetailsMovieView({Key key, this.listItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Populate list view with the data
    if (listItems.hasData) {
      return _buildDetails(context, listItems.data);
    }
    // Display loading indicator
    else if (listItems.hasError) {
      return Center(child: Text(listItems.error.toString()));
    } else {
      return Container(
        height: 300,
        color: Colors.white,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }

  Widget _buildDetails(BuildContext context, MovieDetailsModel moviesModel) {
    return Container(
        color: Colors.white,
        child: new SingleChildScrollView(
            child: new ConstrainedBox(
          constraints: new BoxConstraints(),
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.network(
                  'https://image.tmdb.org/t/p/w500${moviesModel.backdrop_path}',
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(moviesModel.title,
                      style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none)),
                ),
                Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
                    child: Row(
                      children: <Widget>[
                        Text("Release Date: ",
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.red,
                                decoration: TextDecoration.none)),
                        Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Text(moviesModel.release_date,
                                style: TextStyle(
                                    fontSize: 13.0,
                                    color: Colors.black,
                                    decoration: TextDecoration.none)))
                      ],
                    )
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 20, left: 20.0, right: 20.0),
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: _buildCheckItem(
                            "Vote count", moviesModel.vote_count.toString())),
                    Expanded(
                        child: _buildCheckItem("Vote Average",
                            moviesModel.vote_average.toString()))
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: _buildCheckItem(
                            "Budget", moviesModel.budget.toString())),
                    Expanded(
                        child: _buildCheckItem(
                            "Revenue", moviesModel.revenue.toString()))
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: _buildCheckItem("status", moviesModel.status)),
                    Expanded(
                        child: _buildCheckItem(
                            "Popularity", moviesModel.popularity.toString()))
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                  child: Text(
                    "Overview:",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          decoration: TextDecoration.none)
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 10.0),
                  child: Text(moviesModel.overview,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                          decoration: TextDecoration.none)),
                ),
                Padding(
                    padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 10, bottom:20),
                    child: Row(
                      children: <Widget>[
                        Text("Home page: ",
                            style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.blue,
                                decoration: TextDecoration.none)),
                        Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Text(moviesModel.homepage,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 11.0,
                                    color: Colors.black,
                                    decoration: TextDecoration.underline)))
                      ],
                    )),
              ]),
        )));
  }

  Widget _buildCheckItem(String label, String value) {
    return Column(
      children: <Widget>[
        Text(label,
            style: TextStyle(
                fontSize: 12.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none)),
        Text(value == null ? '' : value,
            style: TextStyle(
                fontSize: 11.0,
                color: Colors.black,
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.none))
      ],
    );
  }
}
