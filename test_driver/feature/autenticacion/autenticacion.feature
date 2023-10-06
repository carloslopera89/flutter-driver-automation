Feature: Autenticación app Demo flutter conf latam
  Test autenticacion features

  Scenario: Autenticacion exitosa en la aplicacion de prueba1
    Given que cargo los datos para la prueba con usuario "flutterdriver@mail.com" y clave "1739235"
    When ingreso a la app Demo

  Scenario Outline: Autenticacion exitosa en la aplicacion de prueba2
    Given que cargo los datos para la prueba con usuario <usuario> y clave <clave>
    When ingreso a la app Demo
    Examples:
      | usuario                | clave     |
      | "flutterconflatam@mail.com" | "1739235" |

  Scenario: Autenticacion exitosa en la aplicacion de prueba3
    Given que cargo los datos para la prueba
      | usuario              | clave   | resultadoEsperado |
      | carloslopera@mail.com | 1739235 | carlos            |
    When ingreso a la app Demo con DataTable
    Then la autenticacion deberia ser exitosa


  Scenario: Autenticacion exitosa en la aplicacion de prueba3
    Given que cargo los datos para la prueba
      | usuario              | clave   | resultadoEsperado |
      | flutter@mail.com | 1739235 | dart            |
    When ingreso a la app Demo con DataTable
    Then la autenticacion deberia ser exitosa
