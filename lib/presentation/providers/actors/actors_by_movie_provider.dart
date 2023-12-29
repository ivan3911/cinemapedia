import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/providers/actors/actors_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsByMovieProvider = StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>((ref) {
  final actorsRepository = ref.watch( actorRepositoryProvider );
  return ActorsByMovieNotifier(getActors: actorsRepository.getActorsByMovie);
});


/*
  {
    '565642': <Actor>[],
    '565643': <Actor>[],
    '565644': <Actor>[],
    '565645': <Actor>[],
    '565646': <Actor>[],
  }

*/

typedef GetActorsCallback = Future<List<Actor>>Function(String movieId);

class ActorsByMovieNotifier extends StateNotifier<Map<String,List<Actor>>> {

  final GetActorsCallback getActors;

  ActorsByMovieNotifier({
    required this.getActors
  }): super({});

  Future<void> loadActors(String movieId) async {
    if ( state[movieId] != null ) return;
    
    final List<Actor> actors = await getActors( movieId );
    state = {...state, movieId: actors};
  }

}