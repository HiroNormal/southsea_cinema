import 'package:southsea_cinema/models/movies.dart';

class MoviesRepository {
  List<Movies> getMovies() {
    return const [
      Movies(
          id: 'inception',
          name: 'Inception',
          age: '12A',
          year: '2010',
          runtime: '142',
          date: 'Thursday 22 Oct 2026',
          imagePath: 'assets/images/inception.png'),
      Movies(
        id: 'the-thing',
        name: 'The Thing',
        age: '15',
        year: '1982',
        runtime: '109',
        date: 'Thursday 29 Oct 2026',
        imagePath: 'assets/images/Thing.jpg',
      )
    ];
  }
}
