

import 'dart:async';

import 'package:flutter/material.dart';

import 'login_page.dart';

class SplashHome extends StatefulWidget {

  @override
  _SplashHomeState createState() => _SplashHomeState();
}


class _SplashHomeState extends State<SplashHome> {
  late Timer _timer;


  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 2), _onShowLogin);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _onShowLogin() {
    if(mounted){
      Navigator.of(context).pushReplacement(LoginScreen.route());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      //color: Colors.grey[600],
      child: Column(
        children: <Widget>[
          const SizedBox(height: 160.0),
          const Text(
            'Bienvenido',
            key: ValueKey('labelBienvenido'),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
          ),
          Flexible(
            flex: 2,
            child: SafeArea(
              child: FractionallySizedBox(
                widthFactor: 0.7,
                child: Image.asset('assets/logoflutter.png'),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 16.0),
                alignment: Alignment.bottomCenter,
                child: const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

