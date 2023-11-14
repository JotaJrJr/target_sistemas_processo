// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastrar_text_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CadastrarTextoViewModel on _CadastrarTextoViewModel, Store {
  late final _$tituloControllerAtom =
      Atom(name: '_CadastrarTextoViewModel.tituloController', context: context);

  @override
  TextEditingController get tituloController {
    _$tituloControllerAtom.reportRead();
    return super.tituloController;
  }

  @override
  set tituloController(TextEditingController value) {
    _$tituloControllerAtom.reportWrite(value, super.tituloController, () {
      super.tituloController = value;
    });
  }

  late final _$descricaoControllerAtom = Atom(
      name: '_CadastrarTextoViewModel.descricaoController', context: context);

  @override
  TextEditingController get descricaoController {
    _$descricaoControllerAtom.reportRead();
    return super.descricaoController;
  }

  @override
  set descricaoController(TextEditingController value) {
    _$descricaoControllerAtom.reportWrite(value, super.descricaoController, () {
      super.descricaoController = value;
    });
  }

  late final _$salvarNotaAsyncAction =
      AsyncAction('_CadastrarTextoViewModel.salvarNota', context: context);

  @override
  Future<void> salvarNota() {
    return _$salvarNotaAsyncAction.run(() => super.salvarNota());
  }

  late final _$_CadastrarTextoViewModelActionController =
      ActionController(name: '_CadastrarTextoViewModel', context: context);

  @override
  NoteModel preencherNota() {
    final _$actionInfo = _$_CadastrarTextoViewModelActionController.startAction(
        name: '_CadastrarTextoViewModel.preencherNota');
    try {
      return super.preencherNota();
    } finally {
      _$_CadastrarTextoViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool canSave() {
    final _$actionInfo = _$_CadastrarTextoViewModelActionController.startAction(
        name: '_CadastrarTextoViewModel.canSave');
    try {
      return super.canSave();
    } finally {
      _$_CadastrarTextoViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tituloController: ${tituloController},
descricaoController: ${descricaoController}
    ''';
  }
}
