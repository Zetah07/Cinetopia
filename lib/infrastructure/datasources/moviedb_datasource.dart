import 'package:dio/dio.dart';

import 'package:cinetopia/config/constants/environment.dart';
import 'package:cinetopia/domain/datasources/movies_datasource.dart';

import 'package:cinetopia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinetopia/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:cinetopia/domain/entities/movie.dart';


class MoviedbDatasource extends MoviesDatasource {

  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.theMovieDbKey,
      'language': 'es-MX'
    }
  ));


  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    
    final response = await dio.get('/movie/now_playing');
    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDBResponse.results
    .where((moviedb) => moviedb.posterPath != 'no-poster' )
    .map(
      (moviedb) => MovieMapper.movieDBToEntity(moviedb)
    ).toList();

    return movies;
  }



}