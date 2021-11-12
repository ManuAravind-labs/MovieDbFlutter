import 'package:movie_db/data/model/MovieDetailsModel.dart';
import 'package:movie_db/data/model/MovieListModel.dart';
import 'package:movie_db/data/model/PeopleModel.dart';
import 'package:movie_db/data/model/TVShowDetailModel.dart';
import 'package:movie_db/data/model/TVShowListModel.dart';
import 'package:movie_db/respository/Repository.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc  {

  final repository = Repository();

  final upcomingFetcher = PublishSubject<MovieListModel>();
  final popularFetcher = PublishSubject<MovieListModel>();
  final topRatedFetcher = PublishSubject<MovieListModel>();
  final nowPlayingFetcher = PublishSubject<MovieListModel>();


  final airingTVFetcher = PublishSubject<TVShowListModel>();
  final popularTVFetcher = PublishSubject<TVShowListModel>();
  final topRatedTVFetcher = PublishSubject<TVShowListModel>();
  final onAirTVFetcher = PublishSubject<TVShowListModel>();

  final peopleFetcher = PublishSubject<PeopleModel>();

  final movieDetailFetcher = PublishSubject<MovieDetailsModel>();

  final TVShowDetailFetcher = PublishSubject<TVShowDetailModel>();

  Observable<MovieListModel> get upcomingMoviesList => upcomingFetcher.stream;
  Observable<MovieListModel> get popularMoviesList => popularFetcher.stream;
  Observable<MovieListModel> get topRatedMoviesList => topRatedFetcher.stream;
  Observable<MovieListModel> get nowPlayingMoviesList => nowPlayingFetcher.stream;


  Observable<TVShowListModel> get airingTodayTVList => airingTVFetcher.stream;
  Observable<TVShowListModel> get popularTVList => popularTVFetcher.stream;
  Observable<TVShowListModel> get topRatedTVList => topRatedTVFetcher.stream;
  Observable<TVShowListModel> get onAirTVList => onAirTVFetcher.stream;

  Observable<PeopleModel> get peopleList => peopleFetcher.stream;

  Observable<MovieDetailsModel> get movieDetails => movieDetailFetcher.stream;

  Observable<TVShowDetailModel> get TVShowDetails => TVShowDetailFetcher.stream;

  @override
  dispose() {
    upcomingFetcher.close();
    popularFetcher.close();
    topRatedFetcher.close();
    nowPlayingFetcher.close();

    airingTVFetcher.close();
    popularTVFetcher.close();
    topRatedTVFetcher.close();
    onAirTVFetcher.close();

    peopleFetcher.close();

    movieDetailFetcher.close();
    TVShowDetailFetcher.close();
  }

  void getUpcomingMovies() async {
    MovieListModel movieList = await repository.getUpcomingMovies();
    upcomingFetcher.sink.add(movieList);
  }

  void getPopularMovies() async {
    MovieListModel movieList = await repository.getPopularMovies();
    popularFetcher.sink.add(movieList);
  }

  void getTopRatedMovies() async {
    MovieListModel movieList = await repository.getTopRatedMovies();
    topRatedFetcher.sink.add(movieList);
  }

  void getNowPlayingMovies() async {
    MovieListModel movieList = await repository.getNowPlayingMovies();
    nowPlayingFetcher.sink.add(movieList);
  }


  void getAiringTodayTVShows() async {
    TVShowListModel tvshowList = await repository.getAiringTodayTVShows();
    airingTVFetcher.sink.add(tvshowList);
  }

  void getPopularTVShows() async {
    TVShowListModel tvshowList = await repository.getPopularTVShows();
    popularTVFetcher.sink.add(tvshowList);
  }

  void getTopRatedTVShows() async {
    TVShowListModel tvshowList = await repository.getTopRatedTVShows();
    topRatedTVFetcher.sink.add(tvshowList);
  }

  void getOnAirTVShows() async {
    TVShowListModel tvshowList = await repository.getOnAirTVShows();
    onAirTVFetcher.sink.add(tvshowList);
  }


  void getPeople() async {
    PeopleModel peopleList = await repository.getPeople();
    peopleFetcher.sink.add(peopleList);
  }

  void getMovieDetails(String movieId) async {
    MovieDetailsModel movieDetails = await repository.getMovieDetails(movieId);
    movieDetailFetcher.sink.add(movieDetails);
  }

  void getTVshowDetails(String movieId) async {
    TVShowDetailModel tvShowsDetails = await repository.getTVShowDetails(movieId);
    TVShowDetailFetcher.sink.add(tvShowsDetails);
  }
}

final homeBloc = HomeBloc();