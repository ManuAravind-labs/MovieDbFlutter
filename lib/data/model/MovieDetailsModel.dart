
class MovieDetailsModel {
  int id;
  String title;
  String overview;
  String poster_path;
  String backdrop_path;
  int vote_count;
  double vote_average;
  String release_date;
  int revenue;
  int budget;
  String status;
  double popularity;
  String homepage;
  String original_language;
  String tagline;

  MovieDetailsModel(Map<String, dynamic> data){
    this.id = data['id'];
    this.overview = data['overview'];
    this.title = data['title'];
    this.poster_path = data['poster_path'];
    this.backdrop_path = data['backdrop_path'];
    this.vote_count = data['vote_count'];
    this.vote_average = data['vote_average'];
    this.release_date = data['release_date'];
    this.revenue = data['revenue'];
    this.budget = data['budget'];
    this.status = data['status'];
    this.popularity = data['popularity'];
    this.homepage = data['homepage'];
    this.original_language = data['original_language'];
    this.tagline = data['tagline'];
  }
}