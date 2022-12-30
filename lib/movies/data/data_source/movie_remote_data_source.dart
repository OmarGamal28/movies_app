import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exception.dart';
import 'package:movies_app/core/network/api_constances.dart';
import 'package:movies_app/core/network/error_message_model.dart';
import 'package:movies_app/core/utilites/app_constance.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';
import 'package:movies_app/movies/data/models/recommend_model.dart';
import 'package:movies_app/movies/domain/usecases/get_recommended_movies_usecase.dart';

import '../models/movie_details_model.dart';

abstract class BaseMovieRemoteDataSource{
 Future<List<MovieModel>> getNowPlayingMovies();
 Future<List<MovieModel>> getPopularMovies();
 Future<List<MovieModel>> getTopRatedMovies();
 Future<MovieDetailsModel> getMovieDetails(int parameters);
 Future<List<RecommendModel>> getRecommendMovies(RecommendationParameter parameter);
}


class MovieRemoteDataSource implements BaseMovieRemoteDataSource{
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async{
    final response =  await Dio().get(ApiConstaces.nowPlayingMoviePath);
    if(response.statusCode==200) {
      return List<MovieModel>.from((response.data['results'] as List).map((e) => MovieModel.fromJson(e)));
    } else{
            throw ServerException(errorMessage: ErrorMessage.fromJson(response.data));
    }

  }



  @override
  Future<List<MovieModel>> getPopularMovies() async{
    final response = await  Dio().get(ApiConstaces.getPopularMoviesPath);
    if(response.statusCode==200){
      return List<MovieModel>.from((response.data['results'] as List).map((e) => MovieModel.fromJson(e)));

    } else{
    throw ServerException(errorMessage: ErrorMessage.fromJson(response.data));
    }

  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await  Dio().get(ApiConstaces.getTopRatedMoviesPath);
    if(response.statusCode==200){
      return List<MovieModel>.from((response.data['results'] as List).map((e) => MovieModel.fromJson(e)));

    } else{
      throw ServerException(errorMessage: ErrorMessage.fromJson(response.data));
    }

  }

  @override
  Future<MovieDetailsModel> getMovieDetails(int parameters) async{
    final response = await  Dio().get(ApiConstaces.getMovieDetailsPath(parameters));
    if(response.statusCode==200){
      return MovieDetailsModel.fromJson(response.data);

    } else{
      throw ServerException(errorMessage: ErrorMessage.fromJson(response.data));
    }

  }

  @override
  Future<List<RecommendModel>> getRecommendMovies(RecommendationParameter parameter) async{
    final response =  await Dio().get(ApiConstaces.getMovieRecommend(parameter.id));
    if(response.statusCode==200) {
      return List<RecommendModel>.from((response.data['results'] as List).map((e) => RecommendModel.fromJson(e)));
    } else{
      throw ServerException(errorMessage: ErrorMessage.fromJson(response.data));
    }
  }


}