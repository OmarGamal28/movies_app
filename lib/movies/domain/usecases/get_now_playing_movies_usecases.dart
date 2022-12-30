import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/base_repository.dart';

import '../../../core/error/exception.dart';

class GetNowPlaying extends BaseUseCase<List<Movie>,NoParameters>{
  BaseMoviesRepository baseMoviesRepository;
  GetNowPlaying(this.baseMoviesRepository);
  @override
  Future<Either<Failure,List<Movie>>>  call(NoParameters parameters)async{
    return await baseMoviesRepository.getNowPlaying();
  }
}