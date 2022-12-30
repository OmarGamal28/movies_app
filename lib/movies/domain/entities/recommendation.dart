import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class Recommendation extends Equatable{
  final String? backDropPath;
  final int id;
  const Recommendation({
    this.backDropPath,
    required this.id
});

  @override
  // TODO: implement props
  List<Object?> get props => [id,backDropPath];

}