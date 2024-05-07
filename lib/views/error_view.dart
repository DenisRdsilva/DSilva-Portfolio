import 'package:flutter/material.dart';

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
            color: const Color.fromARGB(255, 39, 28, 110),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const Text("Erro 404", style: TextStyle(fontSize: 60, color: Colors.white, fontFamily: 'Raleway')),
              const Padding(
                padding: EdgeInsets.only(top: 25, bottom: 15),
                child: Text("Este endereço não é válido", style: TextStyle(fontFamily: "Raleway", color: Colors.white, fontSize: 16)),
              ),
              TextButton(
                  child: const Text("Voltar a Página inicial", style: TextStyle(color: Colors.white)),
                  onPressed: () => Navigator.of(context).pushNamed("/"))
            ],
          ),
        ),
              ]),
    );
  }
}
