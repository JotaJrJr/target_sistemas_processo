import 'package:flutter/material.dart';
import 'package:target_sistemas_prova/common/features/cadastro_texto/view/cadastrar_texto_page.dart';
import 'package:target_sistemas_prova/common/features/listar_texto/view/listar_text_page.dart';
import 'package:target_sistemas_prova/common/features/login/viewmodel/login_view_model.dart';
import 'package:target_sistemas_prova/common/features/login/widgets/text_field_widget.dart';
import 'package:target_sistemas_prova/common/widgets/politica_privacidade_widget.dart';

class LoginPage extends StatefulWidget {
  final LoginViewModel? viewModel;

  const LoginPage({super.key, this.viewModel});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginViewModel _viewModel;

  @override
  void initState() {
    _viewModel = widget.viewModel ?? LoginViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Usuário",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const TextFieldWidget(
                      icon: Icon(Icons.person),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Senha",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AnimatedBuilder(
                      animation: _viewModel,
                      builder: (_, __) {
                        return PasswordTextFieldWidget(
                          controller: _viewModel.passwordController,
                          obscureText: _viewModel.obscureText,
                          onPressed: _viewModel.obscurePassword,
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 38,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.green,
                        ),
                        child: InkWell(
                          onTap: () {
                            // if (_viewModel.canLogin()) {
                            //   _navigateToCadastrarTexto();
                            // }

                            _navigateToListarTexto();

                            // TODO snackbar com mensagem de erro
                          },
                          child: const Text(
                            "Entrar",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const PoliticaPrivacidadeWidget()
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToListarTexto() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const ListarTextoPage()));
  }
}

class PasswordTextFieldWidget extends StatelessWidget {
  const PasswordTextFieldWidget({
    super.key,
    required this.onPressed,
    required this.controller,
    required this.obscureText,
  });

  final void Function() onPressed;
  final TextEditingController controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        maxLines: 1,
        decoration: InputDecoration(
            border: InputBorder.none,
            icon: const Icon(Icons.lock),
            focusedBorder: InputBorder.none,
            suffixIcon: IconButton(
              icon: Icon(
                obscureText ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: () {
                onPressed();
              },
            )),
      ),
    );
  }
}
