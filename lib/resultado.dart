import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() restartQuestion;

  const Resultado(this.pontuacao, this.restartQuestion, {super.key});

  String get fraseResultado {
    if (pontuacao == 0) {
      return 'Ops! Você não acertou nenhuma pergunta!';
    } else if (pontuacao <= 2) {
      return 'Nada mal!';
    } else if (pontuacao >= 3 && pontuacao <= 4) {
      return 'Muito bem!';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            {fraseResultado, '\nPontuação: $pontuacao'}.join(),
            style: const TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
          onPressed: restartQuestion,
          child: const Text(
            'Reiniciar',
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 123, 253, 83),
            ),
          ),
        ),
      ],
    );
  }
}
