import 'package:flutter/material.dart';
import 'package:target_sistemas_prova/common/features/cadastro_texto/view/cadastrar_texto_page.dart';
import 'package:target_sistemas_prova/common/features/editar_text/view/editar_text_page.dart';
import 'package:target_sistemas_prova/common/features/listar_texto/viewmodel/listar_text_view_model.dart';
import 'package:target_sistemas_prova/common/models/note_model.dart';

class ListarTextoPage extends StatefulWidget {
  final ListarTextViewModel? viewModel;

  const ListarTextoPage({super.key, this.viewModel});

  @override
  State<ListarTextoPage> createState() => _ListarTextoPageState();
}

class _ListarTextoPageState extends State<ListarTextoPage> {
  late ListarTextViewModel _viewModel;

  List<NoteModel> notes = [];

  @override
  void initState() {
    _viewModel = widget.viewModel ?? ListarTextViewModel();
    _viewModel.getNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.green),
        title: const Text(
          "Lista de Textos",
          style: TextStyle(
            color: Colors.green,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 24, 66, 100),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 24, 66, 100),
        onPressed: () async {
          _navigateToCadastrarTextoPage();
        },
        child: const Icon(
          Icons.add,
          color: Colors.green,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 24, 66, 100),
              Color.fromARGB(255, 103, 190, 106),
            ],
            stops: [
              0.0,
              1.0,
            ],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
          ),
        ),
        child: AnimatedBuilder(
            animation: _viewModel,
            builder: (_, __) {
              return ListView.builder(
                itemCount: _viewModel.notes.length,
                itemBuilder: (_, index) {
                  final note = _viewModel.notes[index];
                  return ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EditarTextoPage(model: note))).then((value) {
                        _viewModel.getNotes();
                      });
                    },
                    title: Text(
                      "ID: ${note.id.toString()}",
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      "Título: ${note.title}",
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              );
            }),
      ),
    );
  }

  void _navigateToCadastrarTextoPage() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const CadastrarTextoPage())).then((value) {
      _viewModel.getNotes();
    });
  }
}
