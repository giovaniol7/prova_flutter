import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../view/TelaLogin.dart';
import '../view/TelaCapturaInformacao.dart';

void main() async {
  String? token;

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Prova Flutter',
    initialRoute: '/login',
    routes: {
      '/login': (context) => const TelaLogin(),
      '/captura': (context) => const TelaCapturaInformacao(),
    },
  ));
}
