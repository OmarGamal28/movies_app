import 'package:dartz/dartz.dart';

import '../../../core/error/exception.dart';
import '../entities/movie.dart';
import '../entities/movie_details.dart';
import '../entities/recommendation.dart';
import '../usecases/get_recommended_movies_usecase.dart';

abstract class BaseMoviesRepository{
  Future<Either<Failure,List<Movie>>> getNowPlaying();
  Future<Either<Failure,List<Movie>>>  getPopularMovies();
  Future<Either<Failure,List<Movie>>>  getTopRatedMovies();
  Future<Either<Failure,MovieDetail>>  getMovieDetails(int parameters);
  Future<Either<Failure,List<Recommendation>>>  getRecommendMovies(RecommendationParameter parameter);


}