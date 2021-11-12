import 'package:movie_db/data/model/TVShowModel.dart';

class TVShowListModel  {
  int page;
  int totalResults;
  int totalPages;
  List<TVShowModel> results = [];
  TVShowListModel(Map<String, dynamic> data){
    this.page = data['page'];
    this.totalResults = data['total_results'];
    this.totalPages = data['total_pages'];
    for (int i = 0; i < data['results'].length; i++) {
      this.results.add(TVShowModel(data['results'][i]));
    }
  }
}
