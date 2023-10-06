import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

import '../../tasks/autenticacion/autenticacion.dart';

class IngresoAPP
    extends WhenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {

    await AutenticacionConDatosTransaccion.autenticacionEnLaAPP(world.driver!);
  }

  @override
  RegExp get pattern => RegExp(r"ingreso a la app Demo");
}

class IngresoAPPConDatable
    extends WhenWithWorld<FlutterWorld> {
  @override
  Future<void> executeStep() async {

    await AutenticacionConDatosTransaccion.autenticacionEnLaAPPConDataTable(world.driver!);
  }

  @override
  RegExp get pattern => RegExp(r"ingreso a la app Demo con DataTable");
}