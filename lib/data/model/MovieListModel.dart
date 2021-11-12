import 'package:movie_db/data/model/MovieModel.dart';

class MovieListModel  {
  int page;
  int totalResults;
  int totalPages;
  List<MovieModel> results = [];
  MovieListModel(Map<String, dynamic> data){
    this.page = data['page'];
    this.totalResults = data['total_results'];
    this.totalPages = data['total_pages'];
    for (int i = 0; i < data['results'].length; i++) {
      this.results.add(MovieModel(data['results'][i]));
    }
  }
}
