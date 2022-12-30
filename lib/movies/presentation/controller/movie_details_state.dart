part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetail? movieDetail;
  final RequestState movieDetailsState;
  final String message;
  final List<Recommendation> recommend;
  final RequestState recommendState;
  final String recommendMessage;

  const MovieDetailsState(
  {
  this.movieDetail,
  this.movieDetailsState=RequestState.isLoading,
  this.message='',
    this.recommend=const[],
    this.recommendMessage='',
    this.recommendState= RequestState.isLoading
  });
  MovieDetailsState copyWith({
     MovieDetail? movieDetail,
     RequestState? movieDetailsState,
     String? message,
    List<Recommendation>? recommend,
     RequestState? recommendState,
    String? recommendMessage,

  })
  {
    return  MovieDetailsState(
      movieDetail:  movieDetail ?? this.movieDetail,
      message:  message ?? this.message,
      movieDetailsState: movieDetailsState?? this.movieDetailsState,
      recommend: recommend?? this.recommend,
      recommendMessage: recommendMessage?? this.recommendMessage,
      recommendState: recommendState ?? this.recommendState,
    );

  }

  @override
  List<Object?> get props => [movieDetail,message,movieDetailsState,recommendState,recommendMessage,recommend];
}

