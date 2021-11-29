import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:clean_architecture/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'Test SignIn with platanitos account',
    (tester) async {
      app.main();

      await tester.pump(const Duration(seconds: 1));
      tester.pumpAndSettle();

      final testFieldFilter = find.byKey(const Key('text_field_filter')).first;

      tester.pumpAndSettle();

      await tester.enterText(testFieldFilter, 'Leanne');
      tester.pumpAndSettle();

      final firstShowPostsButton =
          find.bySemanticsLabel('Ver publicaciones').first;

      await tester.tap(firstShowPostsButton);
      tester.pumpAndSettle();
    },
  );
}
