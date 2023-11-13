import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:target_sistemas_prova/common/domain/services/service_nota.dart';
import 'package:target_sistemas_prova/common/models/note_model.dart';
import 'package:uuid/uuid.dart';

class ServiceNotaImpl implements ServiceNota {
  static List<NoteModel> listaNotas = [];

  ServiceNotaImpl() {
    _fillNotas();
  }

  @override
  Future<NoteModel> createNota(NoteModel model) async {
    model.id = const Uuid().v1().hashCode;

    await _saveOrUpdate(model.id ?? 0, model);
    return model;
  }

  @override
  Future deleteNota(int id) async {
    var data = getNota(id);
    if (data == null) {
      return;
    }
    listaNotas.removeWhere((element) => element.id == id);

    _updateList();
  }

  @override
  Future<NoteModel?> getNota(int id) {
    return Future.value(listaNotas.firstWhere((element) => element.id == id));
  }

  @override
  Future<List<NoteModel>> getNotas() async {
    return listaNotas;
  }

  @override
  Future<NoteModel> updateNota(int id, NoteModel model) async {
    await _saveOrUpdate(id, model);
    return model;
  }

  Future<void> _saveOrUpdate(int id, NoteModel model) async {
    int index = listaNotas.indexWhere((element) => element.id == id);
    if (index != -1) {
      listaNotas[index] = model;
    } else {
      listaNotas.add(model);
    }

    _updateList();
  }

  Future<void> _updateList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('notes', json.encode(listaNotas.map((e) => e.toMap()).toList()));
  }

  void _fillNotas() async {
    List<NoteModel> notes = [];
    if (listaNotas.isNotEmpty) {
      return;
    }

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final notesData = prefs.getString('notes');
    if (notesData != null) {
      final List<dynamic> notesList = json.decode(notesData);
      notes = notesList.map((note) => NoteModel.fromMap(note)).toList();
    }
    listaNotas = notes;
  }
}
