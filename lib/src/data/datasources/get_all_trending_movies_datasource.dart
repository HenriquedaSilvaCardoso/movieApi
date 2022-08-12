
import 'package:all_in_one/src/domain/entities/movie_entity.dart';

abstract class GetAllTrendingMoviesDatasource {
  Future<List<MovieEntity>> getAllTrendingMovies(String timeWindow) ;
}