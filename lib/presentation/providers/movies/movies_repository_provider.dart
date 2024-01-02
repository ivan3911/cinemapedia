import 'package:cinemapedia/infrastructure/datasources/moviedb_datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/infrastructure/repositories/movie_repository_implementation.dart';

//Este repositorio es inmutable
//Su objetivo es proporcionar la informacion necesaria a todos los demas providers
final movieRepositoryProvider =  Provider((ref){
  // return MovieRepositoryImplementation( IMDBDataSource() );
  return MovieRepositoryImplementation( MoviedbDatasource() );
});


