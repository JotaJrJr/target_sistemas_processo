// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listar_text_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListarTextViewModel on _ListarTextViewModel, Store {
  late final _$notesAtom =
      Atom(name: '_ListarTextViewModel.notes', context: context);

  @override
  ObservableList<NoteModel> get notes {
    _$notesAtom.reportRead();
    return super.notes;
  }

  @override
  set notes(ObservableList<NoteModel> value) {
    _$notesAtom.reportWrite(value, super.notes, () {
      super.notes = value;
    });
  }

  late final _$getNotasAsyncAction =
      AsyncAction('_ListarTextViewModel.getNotas', context: context);

  @override
  Future<void> getNotas() {
    return _$getNotasAsyncAction.run(() => super.getNotas());
  }

  @override
  String toString() {
    return '''
notes: ${notes}
    ''';
  }
}
