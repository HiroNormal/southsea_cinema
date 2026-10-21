import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movies.dart';

void main() {
  group('Movie model tests', () {
    test('creates a Movies instance with given properties', () {
      const movie = Movies(
        id: 'inception',
        name: 'Inception',
        age: '12A',
        year: '2010',
        date: 'Thursday 22 Oct 2026',
        runtime: '15:00',
        imagePath: 'assets/images/inception.png',
        description: 'A dream movie.',
        price: 6.0,
      );

      expect(movie.id, 'inception');
      expect(movie.name, 'Inception');
      expect(movie.age, '12A');
      expect(movie.year, '2010');
      expect(movie.date, 'Thursday 22 Oct 2026');
      expect(movie.runtime, '15:00');
      expect(movie.imagePath, 'assets/images/inception.png');
      expect(movie.description, 'A dream movie.');
      expect(movie.price, 6.0);
    });

    test('formattedPrice returns two decimal places with a pound sign', () {
      const movie = Movies(
        id: 'test',
        name: 'Test Movie',
        age: 'PG',
        year: '2026',
        date: 'Thursday 1 Jan 2026',
        runtime: '15:00',
        imagePath: 'assets/images/',
        description: 'A test movie.',
        price: 6.5,
      );

      expect(movie.formattedPrice, '£6.50');
    });

    test('isChildFriendly is true for U and PG ratings only', () {
      const universalMovie = Movies(
        id: 'universal',
        name: 'Universal Movie',
        age: 'U',
        year: '2026',
        date: 'Thursday 1 Jan 2026',
        runtime: '15:00',
        imagePath: 'assets/images/',
        description: 'A universal movie.',
        price: 6.0,
      );
      const pgMovie = Movies(
        id: 'pg',
        name: 'PG Movie',
        age: 'PG',
        year: '2026',
        date: 'Thursday 1 Jan 2026',
        runtime: '15:00',
        imagePath: 'assets/images/',
        description: 'A PG movie.',
        price: 6.0,
      );
      const twelveAMovie = Movies(
        id: '12a',
        name: '12A Movie',
        age: '12A',
        year: '2026',
        date: 'Thursday 1 Jan 2026',
        runtime: '15:00',
        imagePath: 'assets/images/',
        description: 'A 12A movie.',
        price: 6.0,
      );

      expect(universalMovie.isChildFriendly, isTrue);
      expect(pgMovie.isChildFriendly, isTrue);
      expect(twelveAMovie.isChildFriendly, isFalse);
    });

    test('isAdultOnly is true for 18 ratings only', () {
      const adultMovie = Movies(
        id: 'adult',
        name: 'Adult Movie',
        age: '18',
        year: '2026',
        date: 'Thursday 1 Jan 2026',
        runtime: '15:00',
        imagePath: 'assets/images/',
        description: 'An adult movie.',
        price: 6.0,
      );
      const fifteenMovie = Movies(
        id: '15',
        name: '15 Movie',
        age: '15',
        year: '2026',
        date: 'Thursday 1 Jan 2026',
        runtime: '15:00',
        imagePath: 'assets/images/',
        description: 'A 15 movie.',
        price: 6.0,
      );

      expect(adultMovie.isAdultOnly, isTrue);
      expect(fifteenMovie.isAdultOnly, isFalse);
    });
  });
}
