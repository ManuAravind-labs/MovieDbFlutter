import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' show Client;
import 'package:movie_db/data/model/MovieDetailsModel.dart';
import 'package:movie_db/data/model/MovieListModel.dart';
import 'package:movie_db/data/model/PeopleModel.dart';
import 'package:movie_db/data/model/TVShowDetailModel.dart';
import 'package:movie_db/data/model/TVShowListModel.dart';

class APIService {
  Client client = Client();

  final apiKey = '973e0b034af17e62d03ca343795ac965';
  final baseUrl = 'https://api.themoviedb.org/3';


  Future<MovieListModel> getMovies(String type) async {
    final response = await client.get('$baseUrl/movie/$type?api_key=$apiKey');
    if (response.statusCode == HttpStatus.ok) {
      print(response.request.url.toString());
      return MovieListModel(json.decode(response.body));
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<TVShowListModel> getTVShows(String type) async {
    final response = await client.get('$baseUrl/tv/$type?api_key=$apiKey');
    if (response.statusCode == HttpStatus.ok) {
      print(response.request.url.toString());
      return TVShowListModel(json.decode(response.body));
    } else {
      throw Exception('Failed to load TVShows');
    }
  }

  Future<PeopleModel> getPeople() async {
    final response = await client.get('$baseUrl/person/popular?api_key=$apiKey');
    if (response.statusCode == HttpStatus.ok) {

      print(response.request.url.toString());
      return PeopleModel(json.decode(response.body));
    } else {
      throw Exception('Failed to load People');
    }
  }


  Future<MovieDetailsModel> getMovieDetails(String movie_id) async {
    final response = await client.get('$baseUrl/movie/$movie_id?api_key=$apiKey');
    if (response.statusCode == HttpStatus.ok) {
      print(response.request.url.toString());
      return MovieDetailsModel(json.decode(response.body));
    } else {
      throw Exception('Failed to load People');
    }
  }


  Future<TVShowDetailModel> getTVShowDetails(String movie_id) async {
    final response = await client.get('$baseUrl/tv/$movie_id?api_key=$apiKey');
    if (response.statusCode == HttpStatus.ok) {
      print(response.request.url.toString());
      return TVShowDetailModel(json.decode(response.body));
    } else {
      throw Exception('Failed to load People');
    }
  }
}