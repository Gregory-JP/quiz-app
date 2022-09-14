import 'package:flutter/material.dart';
import 'package:projeto_perguntas/perguntas.dart';
import 'package:projeto_perguntas/respostas.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;

  const Questionario({
    super.key,
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
  });

  bool get hasSelectedQuestion {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = hasSelectedQuestion
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];

    return Column(
      children: <Widget>[
        Perguntas(perguntas[perguntaSelecionada]['texto'].toString()),
        ...respostas.map((resp) {
          return Respostas(
            resp['texto'].toString(),
            () => responder(int.parse(resp['pontuacao'].toString())),
          );
        })
      ],
    );
  }
}
