import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cinetopia/domain/entities/movie.dart';

  typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate <Movie?> {

  final SearchMoviesCallback searchMovies;
  SearchMovieDelegate({
    required this.searchMovies
    });

  @override
  String get searchFieldLabel => 'Buscar pelicula';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return[

      if(query.isNotEmpty)
        FadeIn(
          animate: query.isNotEmpty,
          duration: const Duration(milliseconds: 300),
          child: IconButton(onPressed: () => query = '',
          icon: const Icon(Icons.clear)),
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () =>close(context, null),
      icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Placeholder();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: searchMovies(query),
      initialData: const [],
      builder: (context, snapshot) {
        final movies = snapshot.data ?? [];
        
        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index){
            final movie = movies[index];
            return ListTile(
              title: Text(movie.title),
            );
          },
        );
      }
    );
  }

}