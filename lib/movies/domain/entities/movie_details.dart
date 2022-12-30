import 'package:equatable/equatable.dart';

import 'generes.dart';

class MovieDetail extends Equatable{
  final String backDropPath;
  final int id;
  final String overView;
  final String releaseDate;
  final int runTime;
  final String title;
  final double voteAverage;
  final List<Genres> genres;

  const MovieDetail(
      {required this.backDropPath,
        required this.id,
        required this.overView,
        required this.releaseDate,
        required this.runTime,
        required this.title,
        required this.voteAverage,
        required this.genres}
      );

  @override
  // TODO: implement props
  List<Object?> get props => [backDropPath,id,overView,releaseDate,runTime,title,voteAverage,genres];

}