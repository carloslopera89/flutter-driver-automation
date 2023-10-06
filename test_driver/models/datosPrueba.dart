import 'package:gherkin/gherkin.dart';


class DatosPrueba {

  static late GherkinTable table;

  DatosPrueba();

  static Map getMap() {
    return table.asMap().elementAt(0);
  }

  static void setTable(GherkinTable datosPrueba) {
    table = datosPrueba;
  }

}