import 'package:flutter_driver/flutter_driver.dart';

class Enter {
  static Future<void> textWith(
      FlutterDriver driver, SerializableFinder finder, String text) async {
    await driver.tap(finder);
    await driver.enterText(text);
  }
}
