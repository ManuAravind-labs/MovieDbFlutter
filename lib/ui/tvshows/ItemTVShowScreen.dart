import 'package:flutter/material.dart';
import 'package:movie_db/data/model/TVShowListModel.dart';
import 'package:movie_db/data/remote/HomeBloc.dart';
import 'package:movie_db/ui/tvshows/TVShowVerticalListView.dart';
import 'package:rxdart/rxdart.dart';

class ItemTVShowScreen extends StatefulWidget {
  final String type;
  const ItemTVShowScreen({Key key, this.type}) : super(key: key);
  @override
  _ItemTVShowScreenState createState() => _ItemTVShowScreenState();
}

class _ItemTVShowScreenState extends State<ItemTVShowScreen> {

  HomeBloc bloc;

  @override
  void initState() {
    bloc = HomeBloc();
    if(widget.type=="0") {
      bloc.getPopularTVShows();
    }
    else  if(widget.type=="1") {
      bloc.getTopRatedTVShows();
    }
    else  if(widget.type=="2") {
      bloc.getOnAirTVShows();
    }
    else  if(widget.type=="3") {
      bloc.getAiringTodayTVShows();
    }
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildPopularListView();
  }

  Widget _buildPopularListView() {
    return Container(
      child: Column(
        children: <Widget>[
          StreamBuilder(
            stream: getData(),
            builder: (context, AsyncSnapshot<TVShowListModel> snapshot) {
              return TVShowVerticalListView(listItems: snapshot);
            },
          ),
        ],
      ),
    );
  }

  Observable<TVShowListModel> getData(){
    if(widget.type=="0") {
      return  bloc.popularTVList;
    }else  if(widget.type=="1") {
      return  bloc.topRatedTVList;
    }
    else  if(widget.type=="2") {
      return  bloc.onAirTVList;
    }
    else {
      return  bloc.airingTodayTVList;
    }
  }

}
