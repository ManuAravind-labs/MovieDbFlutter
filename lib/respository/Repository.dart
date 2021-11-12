import 'package:movie_db/data/model/MovieDetailsModel.dart';
import 'package:movie_db/data/model/MovieListModel.dart';
import 'package:movie_db/data/model/PeopleModel.dart';
import 'package:movie_db/data/model/TVShowDetailModel.dart';
import 'package:movie_db/data/model/TVShowListModel.dart';
import 'package:movie_db/data/remote/APIService.dart';
import 'package:movie_db/data/remote/MovieType.dart';
import 'package:movie_db/data/remote/TVShowType.dart';

class Repository {
  final apiProvider = APIService();

  Future<MovieListModel> getUpcomingMovies() =>
      apiProvider.getMovies(MovieType.UPCOMING);

  Future<MovieListModel> getPopularMovies() =>
      apiProvider.getMovies(MovieType.POPULAR);

  Future<MovieListModel> getTopRatedMovies() =>
      apiProvider.getMovies(MovieType.TOP_RATED);

  Future<MovieListModel> getNowPlayingMovies() =>
      apiProvider.getMovies(MovieType.NOW_PLAYING);


  Future<TVShowListModel> getAiringTodayTVShows() =>
      apiProvider.getTVShows(TVShowType.AIRING_TODAY);

  Future<TVShowListModel> getPopularTVShows() =>
      apiProvider.getTVShows(TVShowType.POPULAR);

  Future<TVShowListModel> getTopRatedTVShows() =>
      apiProvider.getTVShows(TVShowType.TOP_RATED);

  Future<TVShowListModel> getOnAirTVShows() =>
      apiProvider.getTVShows(TVShowType.ONAIR);


  Future<PeopleModel> getPeople() =>
      apiProvider.getPeople();

  Future<MovieDetailsModel> getMovieDetails(String movieId)=>
      apiProvider.getMovieDetails(movieId);

  Future<TVShowDetailModel> getTVShowDetails(String movieId)=>
      apiProvider.getTVShowDetails(movieId);
}
