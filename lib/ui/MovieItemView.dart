import 'package:flutter/material.dart';
import 'package:movie_db/constant/Constant.dart';
import 'package:movie_db/data/model/MovieModel.dart';
import 'package:movie_db/ui/details/DetailsScreen.dart';

Widget buildMovieItemView(BuildContext context, MovieModel movie) {
  return InkWell(
    child: Card(
      color: Colors.white,
      margin: EdgeInsets.all(10),
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Image.network(
        'https://image.tmdb.org/t/p/w500${movie.posterPath}',
        fit: BoxFit.fill,
        width: 125,
      ),
    ),
    onTap: () => {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailsScreen(movieModel: movie)))
        },
  );
}
