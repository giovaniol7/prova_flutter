// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'informacaoStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$informacaoStore on _informacaoStore, Store {
  late final _$txtTextoAtom =
      Atom(name: '_informacaoStore.txtTexto', context: context);

  @override
  TextEditingController get txtTexto {
    _$txtTextoAtom.reportRead();
    return super.txtTexto;
  }

  @override
  set txtTexto(TextEditingController value) {
    _$txtTextoAtom.reportWrite(value, super.txtTexto, () {
      super.txtTexto = value;
    });
  }

  late final _$listCardAtom =
      Atom(name: '_informacaoStore.listCard', context: context);

  @override
  ObservableList<String> get listCard {
    _$listCardAtom.reportRead();
    return super.listCard;
  }

  @override
  set listCard(ObservableList<String> value) {
    _$listCardAtom.reportWrite(value, super.listCard, () {
      super.listCard = value;
    });
  }

  late final _$usuarioAtom =
      Atom(name: '_informacaoStore.usuario', context: context);

  @override
  String? get usuario {
    _$usuarioAtom.reportRead();
    return super.usuario;
  }

  @override
  set usuario(String? value) {
    _$usuarioAtom.reportWrite(value, super.usuario, () {
      super.usuario = value;
    });
  }

  late final _$editIndexAtom =
      Atom(name: '_informacaoStore.editIndex', context: context);

  @override
  int? get editIndex {
    _$editIndexAtom.reportRead();
    return super.editIndex;
  }

  @override
  set editIndex(int? value) {
    _$editIndexAtom.reportWrite(value, super.editIndex, () {
      super.editIndex = value;
    });
  }

  late final _$carregarUsuarioAsyncAction =
      AsyncAction('_informacaoStore.carregarUsuario', context: context);

  @override
  Future carregarUsuario() {
    return _$carregarUsuarioAsyncAction.run(() => super.carregarUsuario());
  }

  late final _$carregarListaSalvaAsyncAction =
      AsyncAction('_informacaoStore.carregarListaSalva', context: context);

  @override
  Future carregarListaSalva() {
    return _$carregarListaSalvaAsyncAction
        .run(() => super.carregarListaSalva());
  }

  late final _$salvarListaAsyncAction =
      AsyncAction('_informacaoStore.salvarLista', context: context);

  @override
  Future salvarLista() {
    return _$salvarListaAsyncAction.run(() => super.salvarLista());
  }

  @override
  String toString() {
    return '''
txtTexto: ${txtTexto},
listCard: ${listCard},
usuario: ${usuario},
editIndex: ${editIndex}
    ''';
  }
}
