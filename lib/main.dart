import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

void main() => runApp(const QuizApp());

  class QuizAppState extends State<QuizApp> {
    var _perguntaAtual = 0;

    final List<Map<String, Object>> _perguntas = const [
      {
        "texto": "Qual é o país mais populoso do mundo?",
        "respostas": ["Estados Unidos", "China", "Rússia", "Índia"],
        },

      {
        "texto": "E o país com a maior extensão territorial?",
        "respostas": ["Brasil", "Indonésia", "Rússia", "Canadá"],
        },

      {
        "texto": "Em que continente está localizado o Brasil?",
        "respostas": ["América do Sul", "América Central", "África", "Índia"],
        },

      {
        "texto": "Qual o nome do paralelo que divide os dois hemisférios da Terra?",
        "respostas": ["Meridiano de Greenwich", "Trópico de Câncer", "Trópico de Capricórnio", "Linha do Equador"],
        },

      {
        "texto": "Quais são os únicos países que não fazem fronteira com o Brasil?",
        "respostas": ["Chile e Equador", "Bolívia e Peru", "México e Venezuela", "Suriname e Guiana"],
        },

      {
        "texto": "Qual a maior bacia hidrográfica do Brasil?",
        "respostas": ["Bacia Hidrográfica do Tocantins-araguaia", "Bacia Hidrográfica do Paraná", "Bacia Hidrográfica do São Francisco", "Bacia Hidrográfica Amazônica"],
        },

      {
        "texto": "Defina qual das seguintes sentenças representam um país povoado:",
        "respostas": ["Um país com mais de 50 milhões de habitantes", "Um país com alta densidade demográfica", "Um país composto por diversos povos (etnias)", "Um país colonizado"],
        },
        
      {
        "texto": "Quantos países fazem fronteira com a China?",
        "respostas": ["14", "18", "12", "15"],
        },

      {
        "texto": " Quais são as línguas mais faladas na Índia respectivamente?",
        "respostas": ["Hindú, inglês e árabe  ", "Inglês, caxemira e panjabi", "Inglês, hindú e manipuri", "Hindú, inglês e bengalês"],
        },
    ];

    void _responder(){

      if(existePergunta){
        setState(() {
        _perguntaAtual ++;
        });
      }
    }

    bool get existePergunta{
      return _perguntaAtual < _perguntas.length;
    }

  @override
  Widget build(BuildContext context) {

  List<String> respostas = existePergunta
    ? _perguntas[_perguntaAtual].cast()['respostas']
    : [];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Quiz de Geografia!"),
        ),
        body: existePergunta ? Column(
          children: <Widget>[
            Questao(_perguntas[_perguntaAtual]['texto'].toString()),
            ...respostas
  .map((t) => Resposta(t, _responder))
  .toList(),
          ],
        ) : null,
      ),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);
  
  @override
  QuizAppState createState() {
    return QuizAppState(); 
  }

}