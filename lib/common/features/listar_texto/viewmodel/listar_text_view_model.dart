import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:target_sistemas_prova/common/models/note_model.dart';

class ListarTextViewModel extends ChangeNotifier {
  List<NoteModel> notes = [];

  Future<void> getNotes() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final notesData = prefs.getString('notes');
    if (notesData != null) {
      final List<dynamic> notesList = json.decode(notesData);
      notes = notesList.map((note) => NoteModel.fromMap(note)).toList();
    }
    notifyListeners();
  }
}
