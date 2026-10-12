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
      expect(movie.formattedPrice, '£6.00');
    });

    test('creates The Thing movie with given properties', () {
      const movie = Movies(
        id: 'the-thing',
        name: 'The Thing',
        age: '15',
        year: '1982',
        date: 'Thursday 29 Oct 2026',
        runtime: '15:00',
        imagePath: 'assets/images/Thing.jpg',
        description: 'An alien hunts a research team.',
        price: 6.0,
      );

      expect(movie.id, 'the-thing');
      expect(movie.name, 'The Thing');
      expect(movie.age, '15');
      expect(movie.year, '1982');
      expect(movie.date, 'Thursday 29 Oct 2026');
      expect(movie.runtime, '15:00');
      expect(movie.imagePath, 'assets/images/Thing.jpg');
      expect(movie.description, 'An alien hunts a research team.');
      expect(movie.price, 6.0);
      expect(movie.formattedPrice, '£6.00');
    });
  });
}