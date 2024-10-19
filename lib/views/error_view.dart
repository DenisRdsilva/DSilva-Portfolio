import 'package:flutter/material.dart';

import '../main.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: colorTheme.secondary,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Text("Erro 404",
                      style: TextStyle(
                          fontSize: 60,
                          color: colorTheme.primary,
                          fontFamily: 'Raleway')),
                  Padding(
                    padding: EdgeInsets.only(top: 25, bottom: 15),
                    child: Text("Este endereço não é válido",
                        style: TextStyle(
                            fontFamily: "Raleway",
                            color: colorTheme.primary,
                            fontSize: 16)),
                  ),
                  TextButton(
                      child: Text("Voltar a Página inicial",
                          style: TextStyle(color: colorTheme.primary)),
                      onPressed: () => Navigator.of(context).pushNamed("/"))
                ],
              ),
            ),
          ]),
    );
  }
}
