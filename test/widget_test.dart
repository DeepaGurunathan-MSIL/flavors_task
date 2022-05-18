// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flavors_task/service/data_api_call.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flavors_task/main_prod.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  testWidgets('Home page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyAppProd());

    // Verify that our counter starts at 0.
    expect(find.text('Prod'), findsOneWidget);
    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();
  });

  test('Contacts fetched', ()async{

    await DataApiCall().fetchContacts().then((value) {

       expect(value.length, greaterThan(0));
     });
    });
}
