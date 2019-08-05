import 'package:ksi_angulardart_shared/ksi_angulardart_shared.dart';

main() {
  ApiService service = ApiService();
  service.getTopMovies().listen((movies){
    print(movies.length);
  });
}
