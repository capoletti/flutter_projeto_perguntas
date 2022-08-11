import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() aoReiniciar;

  const Resultado({
    required this.pontuacao,
    required this.aoReiniciar,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Text(
          'Sua pontuação foi: $pontuacao',
          style: const TextStyle(fontSize: 28),
        )),
        TextButton(
          onPressed: aoReiniciar,
          child: const Text('Reiniciar!'),
        )
      ],
    );
  }
}
