import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class CheckText extends Then1WithWorld<String, FlutterWorld> {

  CheckText()
      : super(StepDefinitionConfiguration()
    ..timeout = const Duration(seconds: 30));

  @override
  Future<void> executeStep(String value) async {
    await world.driver?.waitFor(find.text(value));
  }

  @override
  RegExp get pattern => RegExp(r"I expect the text {string}");
}