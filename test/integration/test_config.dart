import 'dart:async';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';

import 'steps/check_text.dart';
import 'steps/click_button.dart';
import 'steps/scroll_list.dart';

Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [Glob(r"test/integration/features/watchlist.feature")]
    ..reporters = [ProgressReporter()]
    ..stepDefinitions = [TapButton(),CheckText(),ScrollList()]
    ..restartAppBetweenScenarios = true
    ..buildFlavor = "prod"
    ..targetAppPath = "test/integration/app_test.dart";
  return GherkinRunner().execute(config);
}