import 'package:baseproject/src/constand/constand.dart';
import 'package:baseproject/src/model/movie_details_model.dart';
import 'package:http/http.dart' as http;

class MovieDetailsService {
  Future<MoviesDetailModel> getMovieDetails(String id) async {
    String url = '${AppConstand.BASE_URL}imdbSearchById?movieId=$id';
    final response =
        await http.get(Uri.parse(url), headers: AppConstand.HEADER);
    if (response.statusCode == 200) {
      var result = moviesDetailModelFromJson(response.body);
      return result;
    } else {
      return MoviesDetailModel();
    }
  }
}
