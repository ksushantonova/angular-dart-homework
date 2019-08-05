import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';

import '../../../ksi_angulardart_shared.dart';
part 'movie.state.g.dart';

abstract class MovieState implements Built<MovieState, MovieStateBuilder> {
  MovieState._();
  factory MovieState([void Function(MovieStateBuilder) updates]) = _$MovieState;

  factory MovieState.initial() => MovieState((MovieStateBuilder b) => b
    ..isLoading = false
    ..movies = BuiltList<Movie>());

  factory MovieState.setMovies(MovieState state, List<Movie> movies) =>
     state.rebuild((b) => b..movies = BuiltList<Movie>.from(movies));

  bool get isLoading;
  BuiltList get movies;
}
