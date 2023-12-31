import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {

  final List<Map<String, Object>> perguntas;
  final int perguntaAtual;
  final void Function(int) responder;

  Questionario({
    required  this.perguntas,
    required this.perguntaAtual,
    required this.responder,
  });

  bool get existePergunta{
    return perguntaAtual < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {

      List<Map<String, Object>> respostas = existePergunta
    ? perguntas[perguntaAtual].cast()['respostas']
    : [];

    return Column(
          children: <Widget>[
            Questao(perguntas[perguntaAtual]['texto'].toString()),
            ...respostas.map((resp) {
              return Resposta(
                resp["texto"].toString(),
                () => responder(int.parse(resp['ponto'].toString())),
              );
            }).toList(),
          ],
        );
  }
}