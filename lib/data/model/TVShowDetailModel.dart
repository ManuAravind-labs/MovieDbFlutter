class TVShowDetailModel
{
  int id;
  String name;
  String overview;
  String poster_path;
  String backdrop_path;
  int vote_count;
  double vote_average;
  String first_air_date;

  String status;
  double popularity;
  String homepage;
  String original_language;
  String tagline;

  TVShowDetailModel(Map<String, dynamic> data){
    this.id = data['id'];
    this.overview = data['overview'];
    this.name = data['name'];
    this.poster_path = data['poster_path'];
    this.backdrop_path = data['backdrop_path'];
    this.vote_count = data['vote_count'];
    this.vote_average = data['vote_average'];
    this.first_air_date = data['first_air_date'];

    this.status = data['status'];
    this.popularity = data['popularity'];
    this.homepage = data['homepage'];
    this.original_language = data['original_language'];
    this.tagline = data['tagline'];
  }
}