import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/cart_item.dart';
import 'package:southsea_cinema/models/movies.dart';
import 'package:southsea_cinema/repositories/cart_repository.dart';
import 'package:southsea_cinema/views/basket_view.dart';

const Movies testMovie = Movies(
  id: 'inception',
  name: 'Inception',
  age: '12A',
  year: '2010',
  date: 'Thursday 22 Oct 2026',
  runtime: '15:00',
  imagePath: 'assets/images/Inception.png',
  description: 'A thief enters dreams to steal information.',
  price: 6.0,
);

void main() {
  setUp(() {
    CartRepository.instance.clear();
  });

  testWidgets('BasketView displays empty message when basket has no items', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: BasketView()));

    expect(find.text('Your basket is empty'), findsOneWidget);
    expect(find.text('Checkout'), findsNothing);
  });

  testWidgets(
    'BasketView renders items and removes item when delete pressed',
    (WidgetTester tester) async {
      const CartItem item = CartItem(
        movie: testMovie,
        quantity: 2,
      );
      CartRepository.instance.addItem(item);

      await tester.pumpWidget(const MaterialApp(home: BasketView()));

      expect(find.text('Your basket'), findsOneWidget);
      expect(find.text('2 x Inception'), findsOneWidget);
      expect(find.text('£12.00'), findsWidgets);
      expect(find.text('Checkout'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.delete_outline));
      await tester.pump();

      expect(find.text('Your basket is empty'), findsOneWidget);
    },
  );
}
