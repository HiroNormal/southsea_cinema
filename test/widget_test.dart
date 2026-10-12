import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';

void main() {
  testWidgets('Movie menu loads', (WidgetTester tester) async {
    await tester.pumpWidget(const SouthseaCinemaApp());
    expect(find.textContaining('INCEPTION (2010)'), findsOneWidget);
    expect(find.textContaining('THE THING (1982)'), findsOneWidget);
  });
}
