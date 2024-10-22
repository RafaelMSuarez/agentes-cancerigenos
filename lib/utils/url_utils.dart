import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> urlDialog(BuildContext context, Uri url) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("¿Abrir el navegador?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cerrar"),
          ),
          FilledButton(
            onPressed: () async {
              await launchUrl(url).then(
                (value) {
                  if (!context.mounted) return;
                  Navigator.pop(context);
                },
              );
            },
            child: const Text("Abrir"),
          )
        ],
      );
    },
  );
}

Future<void> iarcWebView(BuildContext context, String? volumen) async {
  Uri url;
  if (volumen == null) return;

  List<String> volumenes = volumen.split(",");
  if (volumenes.last.split(" ").contains("Sup")) {
    url = Uri.parse(
        "https://publications.iarc.who.int/Advanced-Search?q=${volumenes.last.split(" ").last}&category%5B8%5D=on&sort_by=year_desc&limit=20");
  } else {
    url = Uri.parse(
        "https://publications.iarc.who.int/Advanced-Search?q=${volumenes.last}&category%5B7%5D=on&sort_by=year_desc&limit=20");
  }

  return await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("¿Abrir el navegador?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cerrar"),
          ),
          FilledButton(
            onPressed: () async {
              await launchUrl(url).then(
                (value) {
                  if (!context.mounted) return;
                  Navigator.pop(context);
                },
              );
            },
            child: const Text("Abrir"),
          )
        ],
      );
    },
  );
}
