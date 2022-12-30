import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utilites/enum.dart';

import '../../../core/network/error_message_model.dart';
import '../../domain/entities/movie.dart';

class MoviesState extends Equatable{
final List<Movie> nowPlayingMovies;
final RequestState nowPlayingState;
final String message;
final List<Movie> popularMovies;
final RequestState popularState;
final String popularErrorMessage;
final List<Movie> topRatedMovies;
final RequestState topRatedState;
final String topRatedErrorMessage;



const MoviesState( {
  this.nowPlayingMovies=const[],
  this.nowPlayingState= RequestState.isLoading,
  this.message = '',
  this.popularMovies=const[],
  this.popularState=RequestState.isLoading,
  this.popularErrorMessage ='',
  this.topRatedMovies=const[],
  this.topRatedState=RequestState.isLoading,
  this.topRatedErrorMessage='',
});
MoviesState copyWith({
  List<Movie>? nowPlayingMovies,
   RequestState? nowPlayingState,
  String? message,
   List<Movie>? popularMovies,
  RequestState? popularState,
  String? popularErrorMessage,
   List<Movie>? topRatedMovies,
   RequestState? topRatedState,
  String? topRatedErrorMessage,


})
{
  return MoviesState(
    nowPlayingState: nowPlayingState ?? this.nowPlayingState,
    nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
    message: message ?? this.message,
    popularMovies: popularMovies ?? this.popularMovies,
    popularState: popularState ?? this.popularState,
    popularErrorMessage: popularErrorMessage ?? this.popularErrorMessage,
    topRatedMovies: topRatedMovies ?? this.topRatedMovies,
    topRatedState: topRatedState ?? this.topRatedState,
    topRatedErrorMessage: topRatedErrorMessage ?? this.topRatedErrorMessage

  );

}

  @override

  List<Object?> get props => [
    nowPlayingMovies,
    nowPlayingState,
    message,
    popularErrorMessage,
    popularState,
    popularMovies,
    topRatedMovies,
    topRatedErrorMessage,
    topRatedState,
  ];

}