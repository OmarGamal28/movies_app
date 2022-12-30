import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/exception.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/repository/base_repository.dart';

class GetRecommendedUseCase extends BaseUseCase<List<Recommendation>,RecommendationParameter>{
  BaseMoviesRepository baseMoviesRepository;
  GetRecommendedUseCase (this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<Recommendation>>> call(RecommendationParameter parameters) async{
  return await baseMoviesRepository.getRecommendMovies(parameters);
  }

}
class RecommendationParameter extends Equatable {
  final int id;
  const RecommendationParameter(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}