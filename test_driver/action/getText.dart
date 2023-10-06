import 'package:flutter_driver/flutter_driver.dart';

class GetTextElement {

  static Future<String> getTextElement(FlutterDriver driver,SerializableFinder elemento) async {
    return await driver.getText(elemento);
  }
}
