import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/cart_item.dart';
import 'package:southsea_cinema/models/movies.dart';
import 'package:southsea_cinema/repositories/cart_repository.dart';

const Movies testInception = Movies(
  id: 'inception',
  name: 'Inception',
  age: '12A',
  year: '2010',
  runtime: '15:00',
  date: 'Thursday 22 Oct 2026',
  description: 'A thief enters dreams to steal information.',
  price: 6.0,
  imagePath: 'assets/images/Inception.png',
);

void main() {
  setUp(() {
    CartRepository.instance.clear();
  });

  group('CartRepository tests', () {
    test('starts with empty basket and zero totals', () {
      final CartRepository cart = CartRepository.instance;

      expect(cart.getItems().length, 0);
      expect(cart.getTotalItems(), 0);
      expect(cart.totalItemCount, 0);
      expect(cart.getSubtotal(), 0.0);
      expect(cart.getBookingFee(), 0.0);
      expect(cart.getTotalDue(), 0.0);
    });

    test('adds one movie and calculates subtotal and booking fee correctly', () {
      final CartRepository cart = CartRepository.instance;
      const CartItem item = CartItem(
        movie: testInception,
        quantity: 1,
      );

      cart.addItem(item);

      expect(cart.getItems().length, 1);
      expect(cart.getTotalItems(), 1);
      expect(cart.totalItemCount, 1);
      expect(cart.getSubtotal(), 6.0);
      expect(cart.getBookingFee(), 1.50);
      expect(cart.getTotalDue(), 7.50);
    });

    test('removes items correctly', () {
      final CartRepository cart = CartRepository.instance;
      const CartItem item = CartItem(
        movie: testInception,
        quantity: 1,
      );

      cart.addItem(item);
      expect(cart.getItems().length, 1);

      cart.removeItem(0);
      expect(cart.getItems().length, 0);
      expect(cart.getTotalDue(), 0.0);
    });
  });
}