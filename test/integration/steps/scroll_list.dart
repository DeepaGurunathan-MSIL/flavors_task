import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:flutter_driver/flutter_driver.dart';

class ScrollList extends AndWithWorld<FlutterWorld> {
  ScrollList()
      : super(StepDefinitionConfiguration()
    ..timeout = const Duration(seconds: 10));

  @override
  Future<void> executeStep() async {
    final list = find.byValueKey('Contacts List');
    await world.driver?.scroll(list, 0, -2400, const Duration(seconds: 2));
  }

  @override
  RegExp get pattern => RegExp(r"I scroll the list");
}