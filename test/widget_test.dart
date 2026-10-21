import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/main.dart';

void main() {
  testWidgets('SouthseaCinemaApp displays the initial movie menu',
      (WidgetTester tester) async {
    await tester.pumpWidget(const SouthseaCinemaApp());
    await tester.pumpAndSettle();

    expect(find.text(appTitle), findsOneWidget);
    expect(find.textContaining('INCEPTION (2010)'), findsOneWidget);
    expect(find.textContaining('THE THING (1982)'), findsOneWidget);
  });
}
