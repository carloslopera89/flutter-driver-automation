import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'action/enter.dart';
import 'action/validate.dart';

void main(){
  group('autenticacion', (){

    //Definir la estrategia para la identificación de cada uno de los widgets

    final introTitleLabel = find.byValueKey('labelBienvenido');
    final emailText = find.byValueKey('txtCorreo');
    final passwordText = find.byValueKey('txtPassword');
    final btnContinuar = find.byValueKey('btnContinuar');

    //Definir datos de la prueba
    const email = 'pepito@mail.com';
    const password = 'pepito123';

    late FlutterDriver driver;

    // Conectar flutter driver antes de ejecutar el test
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Cerrar la conexión luego de ejecutar los test.
    tearDownAll(() async {
      driver.close();
    });

    //Definición de los test
    test('autenticación app',() async {

      await isPresent(driver, introTitleLabel, const Duration(seconds: 1));
      //await Future.delayed(Duration(seconds: 3));
      await Enter.textWith(driver, emailText, email);
      await Enter.textWith(driver, passwordText, password);
      await driver.tap(btnContinuar);
      await Future.delayed(const Duration(seconds: 2));

    });
  });

}