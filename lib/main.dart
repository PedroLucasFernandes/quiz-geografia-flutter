import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() => runApp(const QuizApp());

  class QuizAppState extends State<QuizApp> {
    var _perguntaAtual = 0;
    var _pontuacaoTotal = 0;

    final List<Map<String, Object>> _perguntas = const [
      {
        "texto": "Qual é o país mais populoso do mundo?",
        "respostas": [
          {"texto": "Estados Unidos", "ponto": 0},
          {"texto": "China", "ponto": 0},
          {"texto": "Rússia", "ponto": 0},
          {"texto": "Índia", "ponto": 1},
          ],
        },

      {
        "texto": "E o país com a maior extensão territorial?",
        "respostas": [
          {"texto": "Brasil", "ponto": 0},
          {"texto": "Indonésia", "ponto": 0},
          {"texto": "Rússia", "ponto": 1},
          {"texto":"Canadá", "ponto": 0},
          ],
        },

      {
        "texto": "Em que continente está localizado o Brasil?",
        "respostas": [
          {"texto": "América do Sul", "ponto": 1},
          {"texto": "América Central", "ponto": 0},
          {"texto": "África", "ponto": 0},
          {"texto": "Índia", "ponto": 0},
          ],
        },

      {
        "texto": "Qual o nome do paralelo que divide os dois hemisférios da Terra?",
        "respostas": [
          {"texto": "Meridiano de Greenwich", "ponto": 0},
          {"texto": "Trópico de Câncer", "ponto": 0},
          {"texto": "Trópico de Capricórnio", "ponto": 0},
          {"texto": "Linha do Equador", "ponto": 1},
          ],
        },

      {
        "texto": "Quais são os únicos países que não fazem fronteira com o Brasil?",
        "respostas": [
          {"texto": "Chile e Equador", "ponto": 1},
          {"texto": "Bolívia e Peru", "ponto": 0},
          {"texto": "México e Venezuela", "ponto": 0},
          {"texto": "Suriname e Guiana", "ponto": 0},
          ],
        },

      {
        "texto": "Qual é o rio mais longo do mundo?",
        "respostas": [
          {"texto": "Amazonas", "ponto": 0},
          {"texto": "Nilo", "ponto": 1},
          {"texto": "Yangtzé", "ponto": 0},
          {"texto": "Mississipi", "ponto": 0},
          ],
        },

      {
        "texto": "Qual a maior bacia hidrográfica do Brasil?",
        "respostas": [
          {"texto": "Bacia Hidrográfica do Tocantins-araguaia", "ponto": 0},
          {"texto": "Bacia Hidrográfica do Paraná", "ponto": 0},
          {"texto": "Bacia Hidrográfica do São Francisco", "ponto": 0},
          {"texto": "Bacia Hidrográfica Amazônica", "ponto": 1},
          ],
        },

      {
        "texto": "Defina qual das seguintes sentenças representam um país povoado:",
        "respostas": [
          {"texto": "Um país com mais de 50 milhões de habitantes", "ponto": 0},
          {"texto": "Um país com alta densidade demográfica", "ponto": 1},
          {"texto": "Um país composto por diversos povos (etnias)", "ponto": 0},
          {"texto": "Um país colonizado", "ponto": 0},
          ],
        },
        
      {
        "texto": "Quantos países fazem fronteira com a China?",
        "respostas": [
          {"texto": "14", "ponto": 1},
          {"texto": "18", "ponto": 0},
          {"texto": "12", "ponto": 0},
          {"texto": "15", "ponto": 0},
          ],
        },

      {
        "texto": "Quais são as línguas mais faladas na Índia respectivamente?",
        "respostas": [
          {"texto": "Hindú, inglês e árabe", "ponto": 0},
          {"texto": "Inglês, caxemira e panjabi", "ponto": 0},
          {"texto": "Hindú, inglês e bengalês", "ponto": 1},
          {"texto": "Inglês, hindú e manipuri", "ponto": 0},
          ],
        },

      {
        "texto": "Qual aspecto climático mais define o clima de monções presente no Sul e Sudeste Asiático?",
        "respostas": [
          {"texto": "Baixíssimas temperaturas durante o inverno", "ponto": 0},
          {"texto": "Baixos índices pluviométricos na maior parte do ano", "ponto": 0},
          {"texto": "Chuvas torrenciais no verão", "ponto": 1},
          {"texto": "Quatro estações do ano bem definidas", "ponto": 0},
          ],
        },

      {
        "texto": "Qual a função da Cordilheira dos Andes na formação dos rios voadores na Bacia Hidrográfica Amazônica?",
        "respostas": [
          {"texto": "Diminuir a umidade presente no solo amazônico", "ponto": 0},
          {"texto": "Desviar o vapor da água de volta para a região Amazônica e outras regiões do Brasil", "ponto": 1},
          {"texto": "Evitar chuvas torrenciais em todas as estações do ano na região", "ponto": 0},
          {"texto": "Rebater as massas de ar polares ocasionando no aumento da umidade regional", "ponto": 0},
          ],
        },
    ];

    void _responder(int ponto){

      if(existePergunta){
        setState(() {
        _perguntaAtual ++;
        _pontuacaoTotal += ponto;
        });
      }
    }

    void _reiniciarQuiz(){
      setState(() {
        _perguntaAtual = 0;
        _pontuacaoTotal = 0;
      });
    }

     bool get existePergunta{
      return _perguntaAtual < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Quiz de Geografia!"),
        ),
        body: existePergunta ? Questionario(
          perguntas: _perguntas,
          perguntaAtual: _perguntaAtual,
          responder: _responder,
        )
        : Resultado(_pontuacaoTotal, _reiniciarQuiz),
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