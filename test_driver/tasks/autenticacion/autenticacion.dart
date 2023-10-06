import 'package:flutter_driver/flutter_driver.dart';
import '../../action/enter.dart';
import '../../action/validate.dart';
import '../../models/datosPrueba.dart';
import '../../models/user/user.dart';
import '../../userinterface/autenticacion/autenticacionPage.dart';
import 'package:test/test.dart';


class AutenticacionConDatosTransaccion {
  static Future<void> autenticacionEnLaAPPConDataTable(FlutterDriver driver) async {
    await driver.runUnsynchronized(() async {
      await driver.waitUntilNoTransientCallbacks(
          timeout: Duration(seconds: 4));

      final datos =  DatosPrueba.getMap();

      await isPresent(driver, introTitleLabel, Duration(seconds: 2));
      //await Future.delayed(Duration(seconds: 3));

      await Enter.textWith(driver, emailText, datos["usuario"]);
      await Enter.textWith(driver, passwordText, datos['clave']);
      await driver.tap(btnContinuar);
    });
  }
  static Future<void> autenticacionEnLaAPP(FlutterDriver driver) async {
    await driver.runUnsynchronized(() async {
      await driver.waitUntilNoTransientCallbacks(
          timeout: Duration(seconds: 4));

      final datos = User.getUser();

      //await isPresent(driver, introTitleLabel, Duration(seconds: 1));
      //await Future.delayed(Duration(seconds: 3));

      await Enter.textWith(driver, emailText, datos.username);
      await Enter.textWith(driver, passwordText, datos.password);
      await driver.tap(btnContinuar);
      await Future.delayed(Duration(seconds: 2));
      //expect(await driver.getText(emailText), contains('carlos'));
    });
  }
}