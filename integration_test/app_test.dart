import 'package:flavors_task/constants/constants.dart';
import 'package:flavors_task/main_prod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';



void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('end-to-end test', () {
    testWidgets('Launch screen',
            (WidgetTester tester) async {

          await tester.pumpWidget(const MyAppProd());

          // Verify the counter starts at 0.
          expect(find.text(Constants.prod), findsOneWidget);

          // Finds the floating action button to tap on.
          final Finder button = find.text(Constants.toHome);

          // Emulate a tap on the floating action button.
          await tester.tap(button);

          // Trigger a frame.
          await tester.pumpAndSettle();

        });
  });
}