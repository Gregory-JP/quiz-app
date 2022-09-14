// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() {
  runApp(const MyApp());
}

class _MyAppState extends State<MyApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  // Perguntas e respostas
  final _perguntas = [
    {
      'texto': 'Onde fica o vulcão mais antigo do mundo?',
      'respostas': [
        {'texto': 'Brasil', 'pontuacao': 1},
        {'texto': 'Espanha', 'pontuacao': 0},
        {'texto': 'Índia', 'pontuacao': 0},
        {'texto': 'França', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Qual o maior deserto do mundo?',
      'respostas': [
        {'texto': 'Sahara', 'pontuacao': 0},
        {'texto': 'Antártica', 'pontuacao': 1},
        {'texto': 'Deserto do México', 'pontuacao': 0},
        {'texto': 'Deserto do Atacama', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Quanto tempo levou a Guerra dos Cem Anos?',
      'respostas': [
        {'texto': '100 anos', 'pontuacao': 0},
        {'texto': '108 anos', 'pontuacao': 0},
        {'texto': '123 anos', 'pontuacao': 0},
        {'texto': '116 anos', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual o maior país do mundo?',
      'respostas': [
        {'texto': 'China', 'pontuacao': 0},
        {'texto': 'Rússia', 'pontuacao': 1},
        {'texto': 'Estados Unidos', 'pontuacao': 0},
        {'texto': 'Brasil', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Qual o maior rio do mundo em volume de água?',
      'respostas': [
        {'texto': 'Rio Uruguai', 'pontuacao': 0},
        {'texto': 'Rio Nilo', 'pontuacao': 0},
        {'texto': 'Rio Yangtze', 'pontuacao': 0},
        {'texto': 'Rio Amazonas', 'pontuacao': 1},
      ],
    },
    {
      'texto':
          'Qual paralelo é a divisa entre Coreia do Norte e Coreia do Sul?',
      'respostas': [
        {'texto': 'Paralelo 36', 'pontuacao': 0},
        {'texto': 'Paralelo 39', 'pontuacao': 0},
        {'texto': 'Paralelo 40', 'pontuacao': 0},
        {'texto': 'Paralelo 38', 'pontuacao': 1},
      ],
    },
  ];

// Fim perguntas e respostas

  // Função para responder
  void _answerQuestion(int pontuacao) {
    if (_hasSelectedQuestion) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  // Função para reiniciar o questionário
  void _restartQuestion() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  // Verifica se tem pergunta selecionada
  bool get _hasSelectedQuestion {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas', style: TextStyle(fontSize: 28)),
          backgroundColor: const Color.fromARGB(255, 123, 253, 83),
          centerTitle: true,
        ),
        body: _hasSelectedQuestion
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _answerQuestion,
              )
            : Resultado(_pontuacaoTotal, _restartQuestion),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
