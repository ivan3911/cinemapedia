import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToEntity( Cast cast) =>
      Actor(
        id: cast.id, 
        name: cast.name, 
        profilePath: cast.profilePath != null 
        ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}' 
        : 'https://st3.depositphotos.com/2546551/18320/v/450/depositphotos_183201806-stock-illustration-male-profile-picture.jpg',
        character: cast.character
      );
}
