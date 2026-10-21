import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movies.dart';
import 'package:southsea_cinema/repositories/movies_repository.dart';

void main() {
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
  });
}
