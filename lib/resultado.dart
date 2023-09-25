import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int ponto;
  final void Function() reiniciarQuiz;

  const Resultado(this.ponto, this.reiniciarQuiz);

  String get fraseResultado {
    if (ponto == 12) {
      return "Parabéns! Você acertou tudo!";
    } else if (ponto > 8) {
      return "Impressionante! Você é muito bom!\n \n"
      "Você acertou ${ponto} de 12!";
    } else if (ponto > 6) {
      return "Boa! Acima da média!\n \n"
      "Você acertou ${ponto} de 12!";
    } else if (ponto > 3) {
      return "Tente outra vez!\n \n"
      "Você acertou ${ponto} de 12.";
    } else {
      return "Estude um pouco mais! Tenho certeza que vai se sair melhor na próxima!\n \n"
      "Você acertou ${ponto} de 12.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              fraseResultado,
              style: const TextStyle(fontSize: 28),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0), // Adicione a margem ao redor do TextButton
          child: TextButton(
            child: const Text(
              "Clique para jogar novamente.",
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
            onPressed: reiniciarQuiz,
          ),
        ),
      ],
    );
  }
}
