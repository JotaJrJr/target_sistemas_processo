import 'package:flutter/material.dart';
import 'package:target_sistemas_prova/common/database/services/service_nota_impl.dart';
import 'package:target_sistemas_prova/common/features/cadastro_texto/viewmodel/cadastrar_text_view_model.dart';
import 'package:target_sistemas_prova/common/models/note_model.dart';
import 'package:target_sistemas_prova/common/widgets/politica_privacidade_widget.dart';

class CadastrarTextoPage extends StatefulWidget {
  final NoteModel? model;

  final CadastrarTextoViewModel? viewModel;

  const CadastrarTextoPage({super.key, this.viewModel, this.model});

  @override
  State<CadastrarTextoPage> createState() => _CadastrarTextoPageState();
}

class _CadastrarTextoPageState extends State<CadastrarTextoPage> {
  late CadastrarTextoViewModel _viewModel;

  @override
  void initState() {
    _viewModel = widget.viewModel ?? CadastrarTextoViewModel(service: ServiceNotaImpl());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.green),
        title: const Text(
          "Cadastrar Texto",
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
                                if (_viewModel.canSave()) {
                                  _viewModel.salvarNota();
                                  Navigator.pop(context);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "Preencha todos os campos",
                                      ),
                                    ),
                                  );
                                }
                              },
                              controller: _viewModel.descricaoController,
                              // maxLines: 8,
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
              PoliticaPrivacidadeWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
