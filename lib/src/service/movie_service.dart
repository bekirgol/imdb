import 'package:baseproject/src/constand/constand.dart';
import 'package:baseproject/src/model/movies_model.dart';
import 'package:http/http.dart' as http;

class MovieService {
  Future<MoviesModel> getMovie(String movie) async {
    String url = '${AppConstand.API_URL}$movie';
    final response =
        await http.get(Uri.parse(url), headers: AppConstand.HEADER);

    if (response.statusCode == 200) {
      var result = moviesModelFromJson(response.body);

      return result;
    } else {
      return MoviesModel();
    }
  }
}
