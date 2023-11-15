import 'package:flutter/material.dart';
import 'package:target_sistemas_prova/common/database/services/service_nota_impl.dart';
import 'package:target_sistemas_prova/common/models/note_model.dart';

class EditarTextoViewModel {
  final ServiceNotaImpl service;

  EditarTextoViewModel({required this.service});

  TextEditingController tituloController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();

  List<NoteModel> notes = [];

  void preencherCampos(String titulo, String descricao) {
    if (titulo.isNotEmpty && descricao.isNotEmpty) {
      tituloController.text = titulo;
      descricaoController.text = descricao;
    }
  }

  void updateNoteModel(NoteModel note) async {
    service.updateNota(note.id!, note);
  }

  Future delete(int id) async {
    await service.deleteNota(id);
  }
}
