import 'package:all_in_one/src/domain/entities/movie_entity.dart';
import 'package:all_in_one/src/domain/usecases/get_all_trending_movies/get_all_trending_movies_usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MoviesNotifier extends StateNotifier<List<MovieEntity>> {
  final GetAllTrendingMoviesUsecase _usecase;
  
  MoviesNotifier(this._usecase) : super([]) {
    getAllTrendingMovies('day');
  }

  Future<void> getAllTrendingMovies(String timeWindow) async {
    state = [];
    state = await _usecase.getAllTrendingMovies(timeWindow);
  }
}
