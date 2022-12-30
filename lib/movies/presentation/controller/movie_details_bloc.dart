



import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utilites/enum.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';

import '../../domain/entities/recommendation.dart';
import '../../domain/usecases/get_movie_details_usecases.dart';
import '../../domain/usecases/get_recommended_movies_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendedUseCase getRecommendedUseCase;
  MovieDetailsBloc(this.getMovieDetailsUseCase,this.getRecommendedUseCase) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>((event, emit) async{
     final result = await getMovieDetailsUseCase( event.id);
     result.fold((l) => emit(state.copyWith(movieDetailsState: RequestState.error,message: l.message)) ,
             (r) => emit(state.copyWith(movieDetail: r,movieDetailsState: RequestState.loaded))
     );

    });
    on<GetMovieRecommendationEvent>((event,emit)async{
      final result =await getRecommendedUseCase(RecommendationParameter(event.id));
      result.fold((l) => emit(state.copyWith(recommendState: RequestState.error,recommendMessage: l.message)),
              (r) => emit(state.copyWith(recommendState: RequestState.loaded,recommend: r))
      );
    });
  }
}
