import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../view/TelaLogin.dart';
import '../view/TelaCapturaInformacao.dart';

void main() async {
  String? token;

  /*final tokenSave = await SharedPreferences.getInstance();
  token = tokenSave.getString('token');

  print(token);*/

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Prova Flutter',
    //initialRoute: token == null || token == '' ? '/login' : '/captura',
    initialRoute: '/login',
    routes: {
      '/login': (context) => const TelaLogin(),
      '/captura': (context) => const TelaCapturaInformacao(),
    },
  ));
}
