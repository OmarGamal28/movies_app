import 'package:movies_app/movies/domain/entities/recommendation.dart';

class RecommendModel extends Recommendation{
  const RecommendModel({super.backDropPath, required super.id});

  factory RecommendModel.fromJson(Map<String,dynamic> json)=> RecommendModel(
      backDropPath: json['backdrop_path'] ?? '/jCY35GkjwWUmoPO9EV1lWL6kuyj.jpg',
      id: json['id']
  );

}