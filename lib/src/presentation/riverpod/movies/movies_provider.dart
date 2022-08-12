import 'package:all_in_one/src/data/datasources/remote/get_all_trending_movies_remote_datasource_imp.dart';
import 'package:all_in_one/src/domain/entities/movie_entity.dart';

import '../../../data/repositories/get_all_trending_movies_repository_imp.dart';
import '../../../domain/usecases/get_all_trending_movies/get_all_trending_movies_usecase_imp.dart';
import 'movies_notifier.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dioProvider = Provider(
  (ref) => Dio(),
);

final moviesDatasourceProvider = Provider((ref) {
  return GetAllTrendingMoviesRemoteDatasourceImp(
    ref.watch(dioProvider),
  );
});

final moviesRepositoryProvider = Provider(
  (ref) {
    return GetAllTrendingMoviesRepositoryImp(
      ref.watch(moviesDatasourceProvider),
    );
  },
);

final moviesUseCaseProvider = Provider(
  (ref) {
    return GetAllTrendingMoviesUsecaseImp(
      ref.watch(moviesRepositoryProvider),
    );
  },
);

final moviesNotifierProvider = StateNotifierProvider<MoviesNotifier, List<MovieEntity>>(
  (ref) {
    return MoviesNotifier(ref.watch(moviesUseCaseProvider));
  },
);
