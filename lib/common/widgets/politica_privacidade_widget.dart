import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
        onTap: () {
          _showWebDialog(context);
        },
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

  _showWebDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: WebViewWidget(
                controller: WebViewController()
                  ..platform
                  ..setJavaScriptMode(JavaScriptMode.unrestricted)
                  ..setBackgroundColor(const Color(0x00000000))
                  ..setNavigationDelegate(
                    NavigationDelegate(
                      onProgress: (int progress) {
                        // Update loading bar.
                      },
                      onPageStarted: (String url) {},
                      onPageFinished: (String url) {},
                      onWebResourceError: (WebResourceError error) {},
                      onNavigationRequest: (NavigationRequest request) {
                        if (request.url.startsWith('https://www.youtube.com/')) {
                          return NavigationDecision.prevent;
                        }
                        return NavigationDecision.navigate;
                      },
                    ),
                  )
                  ..loadRequest(Uri.parse('https://flutter.dev'))),
          );
        });
  }

  Future<void> _launchUrl() async {
    // final Uri _url = Uri.parse('https://www.google.com.br');
    // if (!await launchUrl(_url)) {
    //   throw Exception('Ocorreu algum erro $_url');
    // }

    // if (await canLaunch(url)) {
    //   await launch(url);
    // } else {
    //   throw 'Could not launch $url';
    // }
  }
}
