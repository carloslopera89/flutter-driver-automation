import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';

import '../../question/autenticacion/autenticacionQuestion.dart';
import '../../steps/autenticacion/AutenticacionStepDefinition.dart';
import '../../steps/comunes/PreparacionEscenarioStepDefinition.dart';
import '../../utilidades/comunes/takeScreenshootPass.dart';

Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [Glob(r"test_driver/feature/autenticacion/**.feature")]
    ..reporters = [
      ProgressReporter(),
      TestRunSummaryReporter(),
      JsonReporter(path: './report.json'),
    ] // you can include the "StdoutReporter()" without the message level parameter for verbose log information
   //..hooks = [AttachScreenshotOnFailedStepHook()]
   ..hooks = [AttachScreenshotOnPassStepHook()]
  ..stepDefinitions = [IngresoAPPConDatable(),CargarDatosPruebaConPametros(),CargarDatosPruebaConMap(),IngresoAPP(),VerificoElResultadoAutenticacionExitosa()]
    ..restartAppBetweenScenarios = true
    ..targetAppPath = "test_driver/runners/autenticacion/autenticacionRunner.dart";
    // ..tagExpression = "@smoke" // uncomment to see an example of running scenarios based on tag expressions
  return GherkinRunner().execute(config);
}
