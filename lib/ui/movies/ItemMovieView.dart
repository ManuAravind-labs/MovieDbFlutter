import 'package:flutter/material.dart';
import 'package:movie_db/data/model/MovieModel.dart';


Widget buildItemMovieView(BuildContext context, MovieModel movie) {
  return Card(
    elevation: 5,
    color: Colors.white,
    margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
    child: Container(
        padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
        color: Colors.white,
        child: Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
          Image.network(
            'https://image.tmdb.org/t/p/w500${movie.posterPath}',
            fit: BoxFit.cover,
            width: 100,
          ),

          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      movie.title,
                      style: TextStyle(fontSize: 18),
                      maxLines: 2,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      movie.releaseDate,
                      style: TextStyle(fontSize: 12, color: Colors.pink),
                      maxLines: 2,
                    ),
                  ],
                )),
            ),

        ])),
  );
}
