class ApiConstaces{
  static const String baseUrl='https://api.themoviedb.org/3';
  static const String apiKey ='ba609c23fe9bf99f73aed9106c9cad75';
  static const String nowPlayingMoviePath="$baseUrl/movie/now_playing?api_key=$apiKey";
  static const String getPopularMoviesPath="$baseUrl/movie/popular?api_key=$apiKey";
  static const String getTopRatedMoviesPath="$baseUrl/movie/top_rated?api_key=$apiKey";
  static const String baseImageUrl='https://image.tmdb.org/t/p/w500';
  static String imageUrl (String path)=> '$baseImageUrl$path';
  static String getMovieDetailsPath(int movieId)=>"$baseUrl/movie/$movieId?api_key=$apiKey";
  static String getMovieRecommend(int movieId)=>"$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";
}