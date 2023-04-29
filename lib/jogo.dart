import 'dart:math';
import 'package:flutter/material.dart';

class PagJogo extends StatefulWidget {
  @override
  State<PagJogo> createState() => _PagJogoState();
}

//LÓGICA

class _PagJogoState extends State<PagJogo> {
  List opcoes = ['Pedra', 'Papel', 'Tesoura', 'Lagarto', 'Spock'];
  String mensagem = 'Escolha do jogador: ';

  var imagemEsco = AssetImage('assets/imagens/fundoE.png');

  void Jogada(String escolha) {
    int O = Random().nextInt(opcoes.length);
    String aleatorio = opcoes[0];

    this.imagemEsco = AssetImage('assets/imagens/$aleatorio.png');

    print('TOQUE:' + escolha + ', Random: ' + aleatorio);

    if ( //derrota usuario
        (escolha == 'pedra' && aleatorio == 'papel') ||
            (escolha == 'pedra' && aleatorio == 'spock') ||
            (escolha == 'papel' && aleatorio == 'tesoura') ||
            (escolha == 'papel' && aleatorio == 'lagarto') ||
            (escolha == 'tesoura' && aleatorio == 'spock') ||
            (escolha == 'tesoura' && aleatorio == 'pedra') ||
            (escolha == 'lagarto' && aleatorio == 'pedra') ||
            (escolha == 'lagarto' && aleatorio == 'tesoura') ||
            (escolha == 'spock' && aleatorio == 'lagarto') ||
            (escolha == 'spock' && aleatorio == 'papel')) {
      setState(() {
        this.mensagem = 'DERROTA';
      });
    } else if ( //vitoria usuario
        (escolha == 'pedra' && aleatorio == 'tesoura') ||
            (escolha == 'pedra' && aleatorio == 'lagarto') ||
            (escolha == 'papel' && aleatorio == 'spock') ||
            (escolha == 'papel' && aleatorio == 'pedra') ||
            (escolha == 'tesoura' && aleatorio == 'papel') ||
            (escolha == 'tesoura' && aleatorio == 'lagarto') ||
            (escolha == 'lagarto' && aleatorio == 'spock') ||
            (escolha == 'lagarto' && aleatorio == 'papel') ||
            (escolha == 'spock' && aleatorio == 'tesoura') ||
            (escolha == 'spock' && aleatorio == 'pedra')) {
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

//BODY

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JOGO'),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'PC:',
              ),
            ),
            Image(image: imagemEsco, height: 300),
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Text(
                mensagem,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => Jogada('pedra'),
                  child: Image.asset('assets/imagens/pedra.png'),
                ),
                GestureDetector(
                  onTap: () => Jogada('papel'),
                  child: Image.asset('assets/imagens/papel.png'),
                ),
                GestureDetector(
                  onTap: () => Jogada('tesoura'),
                  child: Image.asset('assets/imagens/tesoura.png'),
                ),
                GestureDetector(
                  onTap: () => Jogada('lagarto'),
                  child: Image.asset('assets/imagens/lagarto.png'),
                ),
                GestureDetector(
                  onTap: () => Jogada('spock'),
                  child: Image.asset('assets/imagens/spock.png'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
