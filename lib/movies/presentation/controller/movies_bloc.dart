import 'package:bloc/bloc.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/core/utilites/enum.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecases.dart';
import 'package:movies_app/movies/presentation/controller/movie_details_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_event.dart';
import 'package:movies_app/movies/presentation/controller/movies_states.dart';
import '../../domain/usecases/get_popular_movies_usecases.dart';
import '../../domain/usecases/get_top_rated_movies_usecases.dart';

class MoviesBloc extends Bloc<MoviesEvent,MoviesState>{
  final GetNowPlaying getNowPlaying;
  final GetPopularMovies getPopularMovies;
  final GetTopRated getTopRated;
  MoviesBloc(this.getNowPlaying, this.getPopularMovies, this.getTopRated): super(const MoviesState()){
    on<GetNowPlayingMoviesEvent>((event, emit) async{
      final result = await getNowPlaying(const NoParameters());

      result.fold(
              (l) => emit(
                  state.copyWith(nowPlayingState: RequestState.error,message: l.message)
              ),
              (r) =>emit(
                  state.copyWith(nowPlayingState: RequestState.loaded,nowPlayingMovies: r)
              )
      );


    });
    on<GetPopularMoviesEvent>((event, emit)async{
      final result = await getPopularMovies(const NoParameters());

      result.fold(
              (l) => emit(
                  state.copyWith(popularErrorMessage: l.message,popularState: RequestState.error)
              ),
              (r) => emit(
                 state.copyWith(popularState: RequestState.loaded,popularMovies: r)
              )
      );
    });
    on<GetTopRatedMoviesEvent>((event, emit)async{
      final result=await getTopRated(const NoParameters());
      result.fold((l) => emit(state.copyWith(topRatedErrorMessage: l.message,topRatedState: RequestState.error)) ,
              (r) => emit (state.copyWith(topRatedMovies: r,topRatedState: RequestState.loaded))
      );
    });



  }

}