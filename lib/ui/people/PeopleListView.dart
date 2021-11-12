import 'package:flutter/material.dart';
import 'package:movie_db/data/model/PeopleModel.dart';
import 'package:movie_db/ui/people/PeopleItemView.dart';

class PeopleListView extends StatelessWidget {
  final AsyncSnapshot<PeopleModel> listItems;

  const PeopleListView({Key key, this.listItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Populate list view with the data
    if (listItems.hasData) {
      return _buildListView(context, listItems.data);
    }
    // Display loading indicator
    else if (listItems.hasError) {
      return Center(child: Text(listItems.error.toString()));
    } else {
      return Container(
        height: 300,
        color: Colors.transparent,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }

  Widget _buildListView(BuildContext context, PeopleModel movies) {
    return Expanded(
      child: Container(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: movies.results.length,
          itemBuilder: (BuildContext context, int index) {
            return buildPeopleItemView(context, movies.results[index]);
          },
        ),
      ),
    );
  }
}
