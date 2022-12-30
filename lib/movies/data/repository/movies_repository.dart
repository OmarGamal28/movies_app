import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exception.dart';
import 'package:movies_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/repository/base_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_recommended_movies_usecase.dart';

class MoviesRepository extends BaseMoviesRepository{
  BaseMovieRemoteDataSource baseMovieRemoteDataSource;
  MoviesRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure,List<Movie>>> getNowPlaying() async{
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try{
      return Right(result);
    } on ServerException catch(error){
      return Left(ServerFailure(error.errorMessage.statusMessage));
    }

  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async{
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try{
      return Right(result);
    } on ServerException catch(error){
      return Left(ServerFailure(error.errorMessage.statusMessage));
    }

  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async
  {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();
    try{
      return Right(result);
    } on ServerException catch(error){
      return Left(ServerFailure(error.errorMessage.statusMessage));
    }

  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetails(int parameters) async
  {
    final result = await baseMovieRemoteDataSource.getMovieDetails(parameters);
    try{
      return Right(result);
    } on ServerException catch(error){
      return Left(ServerFailure(error.errorMessage.statusMessage));
    }

  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendMovies(RecommendationParameter parameter) async{
    final result =await baseMovieRemoteDataSource.getRecommendMovies(parameter);
    try{
      return Right(result);
    }on ServerException catch (error){
      return Left(ServerFailure(error.errorMessage.statusMessage));
    }
  }


}