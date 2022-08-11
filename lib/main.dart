import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() => runApp(const PerguntaApp());

class PerguntaAppState extends State<PerguntaApp> {
  var _perguntasSelecionadas = 0;
  var _pontuacaoTotal = 0;

  void _responder(int pontuacao) {
    setState(() {
      //if (perguntaSelecionada == 2) perguntaSelecionada = -1;
      _perguntasSelecionadas++;
      _pontuacaoTotal += pontuacao;
    });
  }

  void _reiniciar() {
    setState(() {
      _perguntasSelecionadas = 0;
      _pontuacaoTotal = 0;
    });
  }

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 20},
        {'texto': 'Verde', 'pontuacao': 30},
        {'texto': 'Branco', 'pontuacao': 40},
        {'texto': 'Azul', 'pontuacao': 50},
      ],
    },
    {
      'texto': 'Qual o seu animal favorito?',
      'respostas': [
        {'texto': 'Leão', 'pontuacao': 10},
        {'texto': 'Ovelha', 'pontuacao': 20},
        {'texto': 'Zebra', 'pontuacao': 30},
        {'texto': 'Elefante', 'pontuacao': 40},
      ],
    },
    {
      'texto': 'Qual a sua linguagem favorita?',
      'respostas': [
        {'texto': 'Dart', 'pontuacao': 10},
        {'texto': 'Java', 'pontuacao': 20},
        {'texto': 'C#', 'pontuacao': 30},
        {'texto': 'Go', 'pontuacao': 40},
      ],
    },
  ];

  bool get temPergunta {
    return _perguntasSelecionadas < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPergunta
            ? Questionario(
                perguntas: _perguntas,
                perguntasSelecionadas: _perguntasSelecionadas,
                aoResponder: _responder,
              )
            : Resultado(
                pontuacao: _pontuacaoTotal,
                aoReiniciar: _reiniciar,
              ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
}
