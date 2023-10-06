import 'package:flutter/material.dart';

import '../pages/splash_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* Todas sus apliaciones deben de estar dentro de Material App para poder
    hacer uso de las facilidades de Material Design puede omitirce esto pero
    no podran hacer uso de estos widgets de material.dart
     */
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(), //  Tema Claro
      //theme: ThemeData.dark(),
      home: SplashHome(),
    ); // Tema Obscuro
  }
}
