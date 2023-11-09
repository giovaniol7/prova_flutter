import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'informacaoStore.g.dart';

class informacaoStore = _informacaoStore with _$informacaoStore;

abstract class _informacaoStore with Store {
  @observable
  var txtTexto = TextEditingController();

  @observable
  ObservableList<String> listCard = ObservableList<String>();

  @observable
  String? usuario;

  @observable
  int? editIndex;

  @action
  carregarUsuario() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    usuario = prefs.getString('usuario');
  }

  @action
  carregarListaSalva() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    listCard = prefs.getStringList('${usuario}lista')!.asObservable();
  }

  @action
  salvarLista() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('${usuario}lista', listCard.toList());
    carregarListaSalva();
  }
}