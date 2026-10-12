import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';

void main() {
  testWidgets('Movie menu loads', (WidgetTester tester) async {
    await tester.pumpWidget(const SouthseaCinemaApp());
    expect(find.text('Inception'), findsOneWidget);
    expect(find.text('The Thing'), findsOneWidget);
  });
}
