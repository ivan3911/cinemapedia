
//repositorui es inmutable
import 'package:cinemapedia/infrastructure/datasources/actor_moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/actor_repository_implementation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//inmutable
final actorRepositoryProvider =  Provider((ref){
  return ActorRepositoryImplementation( ActorMovieDbDatasource() );
});