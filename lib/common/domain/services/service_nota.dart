import 'package:target_sistemas_prova/common/models/note_model.dart';

abstract class ServiceNota {
  Future<List<NoteModel>> getNotas();
  Future<NoteModel?> getNota(int id);
  Future<NoteModel> createNota(NoteModel model);
  Future<NoteModel> updateNota(int id, NoteModel model);
  Future deleteNota(int id);
}
