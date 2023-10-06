import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

import '../../models/datosPrueba.dart';
import '../../models/user/user.dart';

class CargarDatosPruebaConPametros
    extends Given2WithWorld<String, String, FlutterWorld> {

  @override
  Future<void> executeStep(
      String correo, String clave) async {
    User user = User.usernameAndPass(correo, clave);

    User.setEmailAndPass(user);

    /*
    User user1 = User.getUser();
    print(user1.email);

     */

  }
  @override
  RegExp get pattern =>
      RegExp(r"que cargo los datos para la prueba con usuario {string} y clave {word}");
}

class CargarDatosPruebaConMap
    extends Given1WithWorld<GherkinTable, FlutterWorld> {
  @override
  Future<void> executeStep(GherkinTable dataTable) async {

    DatosPrueba.setTable(dataTable);

    /*final columnas = dataTable.asMap();
    final cliente = columnas.elementAt(0);
    User user = User.documentAndPass(cliente["numero_documento"],
        cliente["tipo_documento"], cliente["clave"]);

     */
  }
  @override
  RegExp get pattern => RegExp(r"que cargo los datos para la prueba");
}


class Given_Given_que_cargo_los_datos_para_la_prueba extends Given1<String> {
  @override
  RegExp get pattern => RegExp(r"que cargo los datos para la prueba");

  @override
  Future<void> executeStep(String input1) async {
    // If the step is "Given I do a 'windy pop'"
    // in this example, input1 would equal 'windy pop'

    // your code...
  }
}