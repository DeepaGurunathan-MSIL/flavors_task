import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';


class TapButton extends Then1WithWorld<String, FlutterWorld> {
  TapButton()
      : super(StepDefinitionConfiguration()
    ..timeout = const Duration(seconds: 30));
  @override
  Future<void> executeStep(String value) async {
    await world.driver?.tap(find.byValueKey(value));
  }

  @override
  RegExp get pattern => RegExp(r'I tap the {String} button');
}
