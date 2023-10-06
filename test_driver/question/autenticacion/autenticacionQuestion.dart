import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:test/test.dart';

import '../../models/datosPrueba.dart';
import '../../action/getText.dart';
import '../../userinterface/autenticacion/autenticacionPage.dart';

class VerificoElResultadoAutenticacionExitosa
    extends ThenWithWorld<FlutterWorld> {

  @override
  Future<void> executeStep() async {
    final datos =  DatosPrueba.getMap();

    final resultadoObtenido = GetTextElement.getTextElement(world.driver!,lbBienvenido);

    String resultadoEsperado = datos['resultadoEsperado'];

    expectMatch(await resultadoObtenido, contains(resultadoEsperado));
    //expect(await resultadoObtenido,contains(resultadoEsperado));
    //expectMatch(await resultadoObtenido, resultadoEsperado)
  }

  @override
  RegExp get pattern => RegExp(r"la autenticacion deberia ser exitosa");
}
