import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntasSelecionadas;
  final void Function(int) aoResponder;

  const Questionario({
    required this.perguntas,
    required this.perguntasSelecionadas,
    required this.aoResponder,
    Key? key,
  }) : super(key: key);

  bool get temPergunta {
    return perguntasSelecionadas < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas =
        temPergunta ? perguntas[perguntasSelecionadas].cast()['respostas'] : [];

    return Column(
      children: [
        Questao(perguntas[perguntasSelecionadas]['texto'].toString()),
        ...respostas.map((resp) {
          return Resposta(resp['texto'].toString(),
              () => aoResponder(int.parse(resp['pontuacao'].toString())));
        }).toList(),
      ],
    );
  }
}
