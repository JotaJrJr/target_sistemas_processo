import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:target_sistemas_prova/common/database/services/service_nota_impl.dart';
import 'package:target_sistemas_prova/common/models/note_model.dart';

part 'cadastrar_text_view_model.g.dart';

class CadastrarTextoViewModel = _CadastrarTextoViewModel with _$CadastrarTextoViewModel;

abstract class _CadastrarTextoViewModel with Store {
  final ServiceNotaImpl service;

  _CadastrarTextoViewModel({required this.service});

  @observable
  TextEditingController tituloController = TextEditingController();

  @observable
  TextEditingController descricaoController = TextEditingController();

  @action
  NoteModel preencherNota() {
    return NoteModel(
      title: tituloController.text,
      description: descricaoController.text,
      data: DateTime.now().millisecondsSinceEpoch,
      user: 1,
    );
  }

  @action
  bool canSave() {
    return tituloController.text.isNotEmpty && descricaoController.text.isNotEmpty;
  }

  @action
  Future<void> salvarNota() async {
    service.createNota(preencherNota());
  }
}
