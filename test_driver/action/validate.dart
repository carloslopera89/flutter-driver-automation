import 'package:flutter_driver/flutter_driver.dart';

Future<bool>  isPresent(FlutterDriver driver, SerializableFinder finder,
    [Duration timeout = const Duration(seconds: 3)]) async {
  bool isPresent = false;
  try {
    await driver.waitFor(finder, timeout: timeout);
    isPresent = true;
  } catch (e) {
    isPresent = false;
  }
  return isPresent;
}

Future<bool> isEnabled(FlutterDriver driver, SerializableFinder finder) async {
  Map widgetDiagnostics = await driver.getWidgetDiagnostics(finder);
  return widgetDiagnostics["properties"]
      .firstWhere((property) => property["name"] == 'enabled')["value"];
}
