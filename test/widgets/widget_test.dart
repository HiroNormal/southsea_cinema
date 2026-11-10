import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/main.dart';

void main() {
  setUp(() {
    rootBundle.clear();
  });

  testWidgets('SouthseaCinemaApp displays the initial movie menu',
      (WidgetTester tester) async {
    await tester.pumpWidget(const SouthseaCinemaApp());
    await tester.pumpAndSettle();

    expect(find.text(appTitle), findsOneWidget);
    expect(find.textContaining('INCEPTION (2010)'), findsOneWidget);
    expect(find.textContaining('THE THING (1982)'), findsOneWidget);
  });

  testWidgets('shows a loading indicator until the films load',
      (WidgetTester tester) async {
    await tester.pumpWidget(const SouthseaCinemaApp());

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.textContaining('INCEPTION (2010)'), findsOneWidget);
  });

  testWidgets('opens the navigation drawer', (WidgetTester tester) async {
    await tester.pumpWidget(const SouthseaCinemaApp());
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();

    expect(find.text('Movie Listing'), findsOneWidget);
    expect(find.text('My Basket'), findsOneWidget);
    expect(find.text('My Settings'), findsOneWidget);
  });
}
