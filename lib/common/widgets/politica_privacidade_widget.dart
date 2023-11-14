import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PoliticaPrivacidadeWidget extends StatelessWidget {
  const PoliticaPrivacidadeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 40,
      ),
      child: InkWell(
        onTap: () => _launchUrl(),
        child: const Text(
          "Política de Privacidade",
          style: TextStyle(
            color: Colors.white,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    final Uri url = Uri.parse('https://www.google.com.br');
    if (!await launchUrl(url)) {
      throw Exception('Ocorreu algum erro $url');
    }
  }
}
