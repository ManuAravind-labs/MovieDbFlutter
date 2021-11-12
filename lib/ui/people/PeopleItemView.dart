import 'package:flutter/material.dart';
import 'package:movie_db/data/model/PeopleModel.dart';



Widget buildPeopleItemView(BuildContext context, ResultsModel result) {
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
        'https://image.tmdb.org/t/p/w500${result.profile_path}',
        fit: BoxFit.fill,
        width: 125,
      ),
    ),
    onTap: () => {

    },
  );
}
