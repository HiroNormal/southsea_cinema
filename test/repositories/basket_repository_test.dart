import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/basket_item.dart';
import 'package:southsea_cinema/models/movies.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';

const Movies testInception = Movies(
  id: 'inception',
  name: 'Inception',
  age: '12A',
  year: '2010',
  runtime: '15:00',
  date: 'Thursday 22 Oct 2026',
  description: 'A thief enters dreams to steal information.',
  price: 6.0,
  imagePath: 'assets/images/inception.png',
);

void main() {
  setUp(() {
    BasketRepository.instance.clear();
  });

  group('BasketRepository tests', () {
    test('starts with empty basket and zero totals', () {
      final BasketRepository basket = BasketRepository.instance;

      expect(basket.getItems().length, 0);
      expect(basket.getTotalItems(), 0);
      expect(basket.totalItemCount, 0);
      expect(basket.getSubtotal(), 0.0);
      expect(basket.getBookingFee(), 0.0);
      expect(basket.getTotalDue(), 0.0);
    });

    test('adds one movie and calculates subtotal and booking fee correctly',
        () {
      final BasketRepository basket = BasketRepository.instance;
      const BasketItem item = BasketItem(
        movie: testInception,
        quantity: 1,
      );

      basket.addItem(item);

      expect(basket.getItems().length, 1);
      expect(basket.getTotalItems(), 1);
      expect(basket.totalItemCount, 1);
      expect(basket.getSubtotal(), 6.0);
      expect(basket.getBookingFee(), 1.50);
      expect(basket.getTotalDue(), 7.50);
    });

    test('removes items correctly', () {
      final BasketRepository basket = BasketRepository.instance;
      const BasketItem item = BasketItem(
        movie: testInception,
        quantity: 1,
      );

      basket.addItem(item);
      expect(basket.getItems().length, 1);

      basket.removeItem(0);
      expect(basket.getItems().length, 0);
      expect(basket.getTotalDue(), 0.0);
    });
  });
}
