import 'package:flutter/material.dart';
import 'package:movie_db/data/model/TVShowModel.dart';
import 'package:movie_db/ui/tvdetails/TVDetailsScreen.dart';



Widget buildTVShowItemView(BuildContext context, TVShowModel tvShow) {
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
        'https://image.tmdb.org/t/p/w500${tvShow.posterPath}',
        fit: BoxFit.cover,
        width: 125,
      ),
    ),
    onTap: () => {
    print(tvShow.id),
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TVDetailsScreen(tvShowModel: tvShow)))
    },
  );
}
