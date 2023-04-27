import 'dart:math';

import 'package:flutter/material.dart';

class PagJogo extends StatefulWidget {
  @override
  State<PagJogo> createState() => _PagJogoState();
}

class _PagJogoState extends State<PagJogo> {
  List opcoes = ['Pedra', 'Papel', 'Tesoura', 'Lagarto', 'Spock'];
  String mensagem = 'Escolha do jogador: ';

  var imagemEsco = AssetImage('imagens/fundoE.png');

  void Jogada(String escolha) {
    int O = Random().nextInt(opcoes.length);
    String aleatorio = opcoes[0];

    this.imagemEsco = AssetImage('imagen/$aleatorio.png');

    print('TOQUE:' + escolha + ', Random: ' + aleatorio);

    if ( //derrota usuario
        (escolha == 'Pedra' && aleatorio == 'Papel') ||
            (escolha == 'Pedra' && aleatorio == 'Spock') ||
            (escolha == 'Papel' && aleatorio == 'Tesoura') ||
            (escolha == 'Papel' && aleatorio == 'Lagarto') ||
            (escolha == 'Tesoura' && aleatorio == 'Spock') ||
            (escolha == 'Tesoura' && aleatorio == 'Pedra') ||
            (escolha == 'Lagarto' && aleatorio == 'Pedra') ||
            (escolha == 'Lagarto' && aleatorio == 'Tesoura') ||
            (escolha == 'Spock' && aleatorio == 'Lagarto') ||
            (escolha == 'Spock' && aleatorio == 'Papel')) {
      setState(() {
        this.mensagem = 'DERROTA';
      });
    } else if ( //vitoria usuario
        (escolha == 'Pedra' && aleatorio == 'Tesoura') ||
            (escolha == 'Pedra' && aleatorio == 'Lagarto') ||
            (escolha == 'Papel' && aleatorio == 'Spock') ||
            (escolha == 'Papel' && aleatorio == 'Pedra') ||
            (escolha == 'Tesoura' && aleatorio == 'Papel') ||
            (escolha == 'Tesoura' && aleatorio == 'Lagarto') ||
            (escolha == 'Lagarto' && aleatorio == 'Spock') ||
            (escolha == 'Lagarto' && aleatorio == 'Papel') ||
            (escolha == 'Spock' && aleatorio == 'Tesoura') ||
            (escolha == 'Spock' && aleatorio == 'Pedra')) {
      setState(() {
        this.mensagem = 'VITORIA';
      });
    } else {
      //empate
      setState(() {
        this.mensagem = 'EMPATE';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JOGO'),
      ),
    );
  }
}
