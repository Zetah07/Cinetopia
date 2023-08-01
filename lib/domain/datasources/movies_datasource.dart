import 'package:cinetopia/domain/entities/movie.dart';

abstract class MovieDataSource {

  Future<List<Movie>> getNowPlaying({ int page =1 });

}