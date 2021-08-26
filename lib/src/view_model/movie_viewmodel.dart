import 'package:baseproject/src/model/movies_model.dart';
import 'package:baseproject/src/service/movie_service.dart';
import 'package:flutter/widgets.dart';

enum MovieState { IDLE, BUSY, ERROR }

class MovieViewModel with ChangeNotifier {
  MovieState? _state;
  MoviesModel? moviesList;
  TextEditingController? _movieController =
      TextEditingController(text: 'inception');

  MovieViewModel() {
    moviesList = MoviesModel();
    _state = MovieState.IDLE;
    fetchMovie();
  }
  MovieState get state => _state!;
  set state(MovieState value) {
    _state = value;
    notifyListeners();
  }

  TextEditingController get movieController => _movieController!;

  Future<MoviesModel> fetchMovie() async {
    try {
      state = MovieState.BUSY;
      moviesList = await MovieService().getMovie(movieController.text);
      state = MovieState.IDLE;
      return moviesList!;
    } catch (e) {
      state = MovieState.ERROR;
      return MoviesModel();
    }
  }

  void sendMovie() {
    fetchMovie();
  }
}
