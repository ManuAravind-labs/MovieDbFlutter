import 'package:flutter/material.dart';
import 'package:movie_db/data/model/TVShowDetailModel.dart';
import 'package:movie_db/data/model/TVShowModel.dart';
import 'package:movie_db/data/remote/HomeBloc.dart';
import 'package:movie_db/ui/tvdetails/TVDetailsShowView.dart';
import 'package:rxdart/rxdart.dart';

class TVDetailsScreen extends StatefulWidget {

  TVShowModel tvShowModel;

  TVDetailsScreen({Key key, @required this.tvShowModel}) : super(key: key);

  @override
  _TVDetailsScreenState createState() => _TVDetailsScreenState();
}

class _TVDetailsScreenState extends State<TVDetailsScreen> {
  HomeBloc bloc;

  @override
  void initState() {
    bloc = HomeBloc();
    bloc.getTVshowDetails(widget.tvShowModel.id.toString());
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
      builder: (context, AsyncSnapshot<TVShowDetailModel> snapshot) {
        return TVDetailsShowView(listItems: snapshot);
      },
    );
  }

  Observable<TVShowDetailModel> getData() {
    return bloc.TVShowDetails;
  }
}
