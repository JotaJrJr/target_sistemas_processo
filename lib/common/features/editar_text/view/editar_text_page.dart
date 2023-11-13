import 'package:flutter/material.dart';
import 'package:target_sistemas_prova/common/database/services/service_nota_impl.dart';
import 'package:target_sistemas_prova/common/features/editar_text/viewmodel/editar_text_view_model.dart';
import 'package:target_sistemas_prova/common/models/note_model.dart';

class EditarTextoPage extends StatefulWidget {
  final NoteModel model;

  final EditarTextoViewModel? viewModel;

  const EditarTextoPage({super.key, required this.model, this.viewModel});

  @override
  State<EditarTextoPage> createState() => _EditarTextoPageState();
}

class _EditarTextoPageState extends State<EditarTextoPage> {
  late EditarTextoViewModel _viewModel;

  @override
  void initState() {
    _viewModel = widget.viewModel ?? EditarTextoViewModel(service: ServiceNotaImpl());

    _viewModel.preencherCampos(widget.model.title!, widget.model.description!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.green),
        title: const Text(
          "Editar Texto",
          style: TextStyle(
            color: Colors.green,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 24, 66, 100),
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
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              // const Spacer(),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: TextField(
                                      textInputAction: TextInputAction.next,
                                      controller: _viewModel.tituloController,
                                      decoration: const InputDecoration(
                                        hintText: "Título",
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        isDense: false,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                // onTap: () => _viewModel.delete(widget.model.id!).then((value) => Navigator.pop(context)),

                                onTap: () => _showDeleteDialog(),

                                child: const CircleAvatar(
                                  radius: 16,
                                  backgroundColor: Colors.red,
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                            ],
                          ),
                          const Divider(
                            endIndent: 10,
                            indent: 10,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              onSubmitted: (value) {
                                _viewModel.updateNoteModel(
                                  NoteModel(
                                    id: widget.model.id,
                                    title: _viewModel.tituloController.text,
                                    description: _viewModel.descricaoController.text,
                                    data: widget.model.data,
                                  ),
                                );
                                Navigator.pop(context);
                              },
                              controller: _viewModel.descricaoController,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                isDense: false,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Digite seu texto",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 40,
                ),
                child: InkWell(
                  onTap: () {},
                  child: const Text(
                    "Política de Privacidade",
                    style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDeleteDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Confirme a exclusão"),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color.fromARGB(255, 24, 66, 100),
                            ),
                          ),
                          child: const Text("Cancelar"),
                        ),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          _viewModel.delete(widget.model.id!).then((value) => Navigator.pop(context));
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color.fromARGB(255, 103, 190, 106),
                            ),
                          ),
                          child: const Text("Confirmar"),
                        ),
                      ),
                      // TextButton(
                      //   onPressed: () {
                      //     _viewModel.delete(widget.model.id!).then((value) => Navigator.pop(context));
                      //   },
                      //   child: const Text("Confirmar"),
                      // ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
