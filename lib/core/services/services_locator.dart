import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecases.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecases.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies_usecases.dart';
import 'package:movies_app/movies/domain/usecases/get_recommended_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies_usecases.dart';
import 'package:movies_app/movies/presentation/controller/movie_details_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';

final sl = GetIt.instance;
class ServicesLocator{
  void init(){
    ///DATASOURCE
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
    ///REPOSITORY
    sl.registerLazySingleton<BaseMoviesRepository>(() => MoviesRepository(sl()));
    ///USECASES
    sl.registerLazySingleton(() => GetNowPlaying(sl()));
    sl.registerLazySingleton(() => GetTopRated(sl()));
    sl.registerLazySingleton(() => GetPopularMovies(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendedUseCase(sl()));
    ///bloc
    sl.registerFactory(() => MoviesBloc(sl(),sl(),sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl(),sl()));
  }


}