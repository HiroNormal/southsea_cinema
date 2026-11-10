import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movies.dart';
import 'package:southsea_cinema/repositories/movies_repository.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('MoviesRepository unit tests', () {
    test('getMovies returns a list with two items', () {
      final MoviesRepository repository = MoviesRepository();
      final List<Movies> movies = repository.getMovies();

      expect(movies.length, 2);
    });

    test('getMovies contains Inception and The Thing', () {
      final repository = MoviesRepository();
      final movies = repository.getMovies();

      final inception = movies[0];
      expect(inception.id, 'inception');
      expect(inception.name, 'Inception');
      expect(inception.age, '12A');
      expect(inception.year, '2010');
      expect(inception.price, 6.00);
      expect(inception.imagePath, isNotEmpty);

      final theThing = movies[1];
      expect(theThing.id, 'the-thing');
      expect(theThing.name, 'The Thing');
      expect(theThing.age, '15');
      expect(theThing.year, '1982');
      expect(theThing.price, 6.00);
      expect(theThing.imagePath, isNotEmpty);
    });

    test('getMovieById returns matching movie when id exists', () {
      final MoviesRepository repository = MoviesRepository();
      final Movies? movie = repository.getMovieById('inception');

      expect(movie, isNotNull);
      expect(movie?.name, 'Inception');
      expect(movie?.price, 6.00);
    });

    test('getMovieById returns null when id does not exist', () {
      final MoviesRepository repository = MoviesRepository();
      final Movies? movie = repository.getMovieById('non-existent');

      expect(movie, isNull);
    });

    test('loadMoviesFromAsset reads every film from movies.json', () async {
      final MoviesRepository repository = MoviesRepository();
      final List<Movies> movies = await repository.loadMoviesFromAsset();

      expect(movies.length, 2);

      expect(movies[0].id, 'inception');
      expect(movies[0].name, 'Inception');
      expect(movies[0].age, '12A');
      expect(movies[0].year, '2010');
      expect(movies[0].date, 'Thursday 22 Oct 2026');
      expect(movies[0].runtime, '15:00');
      expect(movies[0].imagePath, 'assets/images/inception.png');
      expect(movies[0].description, isNotEmpty);
      expect(movies[0].price, 6.00);

      expect(movies[1].id, 'the-thing');
      expect(movies[1].name, 'The Thing');
      expect(movies[1].age, '15');
      expect(movies[1].year, '1982');
      expect(movies[1].date, 'Thursday 29 Oct 2026');
      expect(movies[1].runtime, '15:00');
      expect(movies[1].imagePath, 'assets/images/thing.jpg');
      expect(movies[1].description, isNotEmpty);
      expect(movies[1].price, 6.00);

      expect(repository.getMovies(), movies);
    });
  });
}
