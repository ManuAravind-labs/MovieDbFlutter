import 'package:flutter/material.dart';
import 'package:movie_db/data/model/PeopleModel.dart';
import 'package:movie_db/data/remote/HomeBloc.dart';
import 'package:movie_db/ui/people/PeopleListView.dart';
import 'package:rxdart/rxdart.dart';

class PeopleScreen extends StatefulWidget {
  final String type;
  const PeopleScreen({Key key, this.type}) : super(key: key);
  @override
  _PeopleScreenState createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {

  HomeBloc bloc;

  @override
  void initState() {
    bloc = HomeBloc();
    bloc.getPeople();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("People",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),),

        ),
        body: _buildPeopleListView());
  }

  Widget _buildPeopleListView() {
    return Container(
      child: Column(
        children: <Widget>[
          StreamBuilder(
            stream: getData(),
            builder: (context, AsyncSnapshot<PeopleModel> snapshot) {
              return PeopleListView(listItems: snapshot);
            },
          ),
        ],
      ),
    );
  }

  Observable<PeopleModel> getData(){
      return  bloc.peopleList;
  }

}
