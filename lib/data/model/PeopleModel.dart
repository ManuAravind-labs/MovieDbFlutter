class PeopleModel {
  int page;
  int totalResults;
  int totalPages;
  List<ResultsModel> results = [];

  PeopleModel(Map<String, dynamic> data){
    this.page = data['page'];
    this.totalResults = data['total_results'];
    this.totalPages = data['total_pages'];
    for (int i = 0; i < data['results'].length; i++) {
      this.results.add(ResultsModel(data['results'][i]));
    }
  }
}


 class ResultsModel {
   int id;
   String name;
   String profile_path;

   ResultsModel(Map<String, dynamic> data) {
     this.id = data['id'];
     this.name = data['name'];
     this.profile_path = data['profile_path'];
   }
 }
