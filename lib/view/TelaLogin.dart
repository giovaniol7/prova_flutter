import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final keyUsuario = GlobalKey<FormState>();
  final keySenha = GlobalKey<FormState>();
  var txtUsuario = TextEditingController();
  var txtSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(29, 79, 97, 1),
              Color.fromRGBO(51, 144, 137, 1),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(40),
              child: Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.25),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10, bottom: 1),
                      alignment: Alignment.bottomLeft,
                      child: const Text('Usuário', style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                    Container(
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(offset: Offset(0, 2), color: Colors.black38, blurRadius: 2)
                              // changes position of shadow
                            ]),
                        child: Form(
                            key: keyUsuario,
                            child: TextFormField(
                              controller: txtUsuario,
                              maxLength: 20,
                              maxLengthEnforcement: MaxLengthEnforcement.enforced,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                              decoration: InputDecoration(
                                counterText: '',
                                contentPadding: const EdgeInsets.symmetric(vertical: 20),
                                prefixIcon: GestureDetector(
                                  child: const Icon(FontAwesomeIcons.solidUser, color: Colors.black87, size: 18),
                                ),
                                prefixIconColor: Colors.black,
                                labelText: '',
                                labelStyle:
                                    const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
                                border: const OutlineInputBorder(),
                                focusColor: Colors.grey[100],
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(RegExp(r'\s')),
                              ],
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'A senha não pode ser vazia';
                                }
                                if (value.length > 20) {
                                  return 'O usuário não deve ultrapassar 20 caracteres';
                                }
                                return null;
                              },
                            ))),
                    const SizedBox(height: 20),
                    Container(
                      margin: const EdgeInsets.only(left: 10, bottom: 1),
                      alignment: Alignment.bottomLeft,
                      child: const Text('Senha', style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                    Container(
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(offset: Offset(0, 2), color: Colors.black38, blurRadius: 2)
                              // changes position of shadow
                            ]),
                        child: Form(
                            key: keySenha,
                            child: TextFormField(
                              controller: txtSenha,
                              maxLength: 20,
                              maxLengthEnforcement: MaxLengthEnforcement.enforced,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                              decoration: InputDecoration(
                                counterText: '',
                                contentPadding: const EdgeInsets.symmetric(vertical: 20),
                                prefixIcon: GestureDetector(
                                  child: const Icon(FontAwesomeIcons.lock, color: Colors.black87, size: 18),
                                ),
                                prefixIconColor: Colors.black,
                                labelText: '',
                                labelStyle:
                                    const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
                                border: const OutlineInputBorder(),
                                focusColor: Colors.grey[100],
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 3.0,
                                  ),
                                ),
                                focusedErrorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
                              ],
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'A senha não pode ser vazia';
                                }
                                if (value.length < 2) {
                                  return 'A senha deve ter no mínimo 2 caracteres';
                                }
                                if (value.length > 20) {
                                  return 'A senha não deve ultrapassar 20 caracteres';
                                }
                                return null;
                              },
                            ))),
                    const SizedBox(height: 40),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          shadowColor: Colors.black38,
                          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 70, right: 70),
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.green,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          )),
                      child: const Text('Entrar', style: TextStyle(fontSize: 18)),
                      onPressed: () async {
                        if (keyUsuario.currentState!.validate() && keySenha.currentState!.validate()) {
                          String usuario = txtUsuario.text;
                          final usuarioSave = await SharedPreferences.getInstance();
                          await usuarioSave.setString('usuario', usuario);
                          Navigator.pushNamed(context, '/captura');
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Align(
                  child: TextButton(
                    child: const Text('Política de Privacidade', style: TextStyle(color: Colors.white, fontSize: 16)),
                    onPressed: () async {
                      Uri url = Uri.parse('https://www.google.com.br/');
                      if (!await launchUrl(url, mode: LaunchMode.inAppBrowserView)) {
                        throw Exception('Could not launch $url');
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
