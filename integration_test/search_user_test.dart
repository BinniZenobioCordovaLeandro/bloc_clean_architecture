import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:clean_architecture/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'Test show posts from a user',
    (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final testFieldFilter = find.byKey(const Key('text_field_filter')).first;
      await tester.pumpAndSettle();

      await tester.enterText(testFieldFilter, 'Leanne');
      await tester.pumpAndSettle();

      final firstShowPostsButton =
          find.bySemanticsLabel('Ver publicaciones').first;

      await tester.tap(firstShowPostsButton);
      await tester.pumpAndSettle();

      await tester.pump(const Duration(seconds: 5));
    },
  );
}
