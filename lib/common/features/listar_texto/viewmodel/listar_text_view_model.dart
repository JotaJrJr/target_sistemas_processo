import 'package:mobx/mobx.dart';
import 'package:target_sistemas_prova/common/database/services/service_nota_impl.dart';
import 'package:target_sistemas_prova/common/models/note_model.dart';

part 'listar_text_view_model.g.dart';

class ListarTextViewModel = _ListarTextViewModel with _$ListarTextViewModel;

abstract class _ListarTextViewModel with Store {
  final ServiceNotaImpl service;

  _ListarTextViewModel({required this.service});

  @observable
  ObservableList<NoteModel> notes = ObservableList<NoteModel>.of([]);

  @action
  Future<void> getNotas() async {
    notes.clear();
    notes.addAll(await service.getNotas());
  }
}
