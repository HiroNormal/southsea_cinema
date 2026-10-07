import 'package:southsea_cinema/models/movies.dart';

class MoviesRepository {
  List<Movies> getMovies(){
    return const[
      Movies(
        id: 'movie',
        name: 'Inception',
        age: '12A',
        year: '2010',
        runtime: '142',
        date: 'Thursday 22 Oct 2026',
        imagePath: 'assets/images/inception.png'

      )
    ];
  }
}