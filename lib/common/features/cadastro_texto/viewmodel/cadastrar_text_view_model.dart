import 'package:flutter/material.dart';
import 'package:target_sistemas_prova/common/database/services/service_nota_impl.dart';
import 'package:target_sistemas_prova/common/models/note_model.dart';

class CadastrarTextoViewModel {
  final ServiceNotaImpl service;

  CadastrarTextoViewModel({required this.service});

  TextEditingController tituloController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();

  NoteModel preencherNota() {
    return NoteModel(
      title: tituloController.text,
      description: descricaoController.text,
      data: DateTime.now().millisecondsSinceEpoch,
      user: 1,
    );
  }

  bool canSave() {
    return tituloController.text.isNotEmpty && descricaoController.text.isNotEmpty;
  }

  Future<void> salvarNota() async {
    service.createNota(preencherNota());
  }
}
