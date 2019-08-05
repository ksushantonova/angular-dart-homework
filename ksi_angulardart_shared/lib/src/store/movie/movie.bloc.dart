import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../ksi_angulardart_shared.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  ApiService _service = ApiService();

  void dispatchGetMovies(){
    dispatch(GetMovies());
  }

  @override
  MovieState get initialState => MovieState.initial();

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    if (event is GetMovies){
      Completer completer = Completer();
      _service.getTopMovies().listen((movies) {
        completer.complete(movies);
      });

      List movies = await completer.future;
      print(movies);
      yield MovieState.setMovies(currentState, movies);
    }
  }
}