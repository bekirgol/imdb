import 'package:baseproject/src/model/movie_details_model.dart';
import 'package:baseproject/src/service/movie_details_service.dart';
import 'package:flutter/widgets.dart';

enum MovieDetailState { IDLE, BUSY, ERROR }

class MovieDetailsViewModel with ChangeNotifier {
  MovieDetailState? _state;
  MoviesDetailModel? moviesDetail;
  String? _id;

  MovieDetailsViewModel() {
    moviesDetail = MoviesDetailModel();
    _state = MovieDetailState.BUSY;
    fetchMovieDetail();
  }

  String get id => _id!;
  set id(value) {
    _id = value;
    notifyListeners();
  }

  MovieDetailState get state => _state!;
  set state(value) {
    _state = value;
    notifyListeners();
  }

  Future<MoviesDetailModel> fetchMovieDetail() async {
    try {
      state = MovieDetailState.BUSY;
      moviesDetail = await MovieDetailsService().getMovieDetails(id);
      state = MovieDetailState.IDLE;
      return moviesDetail!;
    } catch (e) {
      state = MovieDetailState.ERROR;
      return MoviesDetailModel();
    }
  }
}
