import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exception.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/repository/base_repository.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetail,int>{
  BaseMoviesRepository baseMoviesRepository;
  GetMovieDetailsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetail>> call(int parameters) async{
    return await baseMoviesRepository.getMovieDetails( parameters);


  }

}