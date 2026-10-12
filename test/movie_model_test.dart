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
      expect(movie.description, 'A dream-infiltration thriller.');
      expect(movie.price, 6.0);
      expect(movie.formattedPrice, '£6.00');
    });
  });
}