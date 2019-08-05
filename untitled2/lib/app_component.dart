import 'package:angular/angular.dart';
import 'package:ksi_angulardart_shared/ksi_angulardart_shared.dart';
import 'package:untitled2/src/movie-info/movie_info.dart';


// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [coreDirectives, MovieInfo],
  pipes: [commonPipes],
  providers: [ClassProvider(ApiService), ClassProvider(MovieBloc)]
)
class AppComponent implements OnInit{
   AppComponent(this._apiService, this._movieBloc);

   ApiService _apiService;

   MovieBloc _movieBloc;

   List<Movie> movies;

   @override
   void ngOnInit(){
      _movieBloc.dispatchGetMovies();
      _movieBloc.state.listen((state) {
         movies = state.movies.toList();
      });
   }

   void handleOpenMovie(int id){
      print(id);
   }
}
