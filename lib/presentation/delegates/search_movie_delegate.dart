import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

typedef SearchMoviesCallback = Future<List<Movie>> Function( String query );

class SearchMovieDelegate extends SearchDelegate<Movie?> {


  final SearchMoviesCallback searchMovies;

  SearchMovieDelegate(
    {required this.searchMovies}
    );


  @override
  String get searchFieldLabel => 'Buscar pelicula';

  //Cualquier indicador para que esta cargando
  @override
  List<Widget>? buildActions(BuildContext context) {
    print('Query: $query');

    return [
      // if ( query.isNotEmpty )
      FadeIn(
        animate: query.isNotEmpty, //se utilizo para quitar el if de arriba
        // duration: const Duration(milliseconds: 200),
        child: IconButton(
            onPressed: () => query = '', 
            icon: const Icon(Icons.clear)
          ),
      ),
    ];
  }

  //Para regresar al screen anterior
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back_ios_new_rounded));
  }

  //se presiona enter
  @override
  Widget buildResults(BuildContext context) {
    return const Text('BuildResults');
  }

  //Sugerencias cuando esta escribiendo
  @override
  Widget buildSuggestions(BuildContext context) {
    return const Text('BuildSuggestions');
  }
}
