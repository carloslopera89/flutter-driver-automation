import 'package:flutter/material.dart';

import '../utils/expresion_regular.dart';
import 'home_page.dart';

class LoginScreen extends StatefulWidget {
  static Route<dynamic> route() {
    return MaterialPageRoute(
      builder: (context) => LoginScreen(),
    );
  }

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  GlobalKey<FormState> _key = GlobalKey();

  late String _correo;
  late String _contrasena;
  String mensaje = '';
  bool _logueado = false;
  ExpresionRegular expresionRegular = ExpresionRegular();

  initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    //    Descomentar las siguientes lineas para generar un efecto de "respiracion"
    /*animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
     */

    controller.forward();
  }

  dispose() {
    // Es importante SIEMPRE realizar el dispose del controller.
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _logueado ? HomeScreen(mensaje: mensaje) : loginForm(),
//      body: loginForm(),
    );
  }

  Widget loginForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedLogo(animation: animation),
          ],
        ),
        Container(
          width: 300.0, //size.width * .6,
          child: Form(
            key: _key,
            child: Column(
              children: <Widget>[
                TextFormField(
                  key: const ValueKey('txtCorreo'),
                  validator: (text) {
                    if (text!.isEmpty) {
                      return "Este campo correo es requerido";
                    } else if (!expresionRegular.expresionRegularEmail(text)) {
                      return "El formato para correo no es correcto";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  maxLength: 50,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    // hintText: 'Ingrese su Correo',
                    labelText: 'Correo',
                    counterText: '',
                    icon:
                    Icon(Icons.email, size: 32.0, color: Colors.blue[800]),
                  ),
                  onSaved: (text) => _correo = text!,
                ),
                TextFormField(
                  key: const ValueKey('txtPassword'),
                  validator: (text) {
                    if (text!.length == 0) {
                      return "Este campo contraseña es requerido";
                    } else if (text.length <= 5) {
                      return "Su contraseña debe ser al menos de 5 caracteres";
                    } else if (!expresionRegular.expresionRegularPassword(text)) {
                      return "El formato para contraseña no es correcto";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  maxLength: 20,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    //hintText: 'Ingrese su Contraseña',
                    labelText: 'Contraseña',
                    counterText: '',
                    icon: Icon(Icons.lock, size: 32.0, color: Colors.blue[800]),
                  ),
                  onSaved: (text) => _contrasena = text!,
                ),
                const SizedBox(height: 20.0),

                ElevatedButton(
                  key: const ValueKey('btnContinuar'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      _key.currentState!.save();
                      //Aqui se llamaria a su API para hacer el login
                      setState(() {
                        _logueado = true;
                      });
                      mensaje = 'Gracias \n $_correo \n $_contrasena';
//                      Una forma correcta de llamar a otra pantalla
//                      Navigator.of(context).push(HomeScreen.route(mensaje));
                    }
                  },
                  child: const Text('INGRESAR'),
                )

                /*    IconButton(
                  onPressed: () {
                    if (_key.currentState.validate()) {
                      _key.currentState.save();
                      //Aqui se llamaria a su API para hacer el login
                      setState(() {
                        _logueado = true;
                      });
                      mensaje = 'Gracias \n $_correo \n $_contrasena';
//                      Una forma correcta de llamar a otra pantalla
//                      Navigator.of(context).push(HomeScreen.route(mensaje));
                    }
                  },
                  icon: Icon(
                    Icons.arrow_forward,
                    size: 42.0,
                    color: Colors.blue[800],
                  ),
                )

             */

              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AnimatedLogo extends AnimatedWidget {
  // Maneja los Tween estáticos debido a que estos no cambian.
  static final _opacityTween = Tween<double>(begin: 0.1, end: 1.0);
  static final _sizeTween = Tween<double>(begin: 0.0, end: 150.0);

  const AnimatedLogo({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
     Animation<double>? animation = listenable as Animation<double>?;
    return Opacity(
      opacity: _opacityTween.evaluate(animation!),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        height: _sizeTween.evaluate(animation), // Aumenta la altura
        width: _sizeTween.evaluate(animation), // Aumenta el ancho
        //child: FlutterLogo(),
        child: Image.asset('assets/splashflutter.png'),

      ),
    );
  }
}
