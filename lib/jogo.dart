import 'package:flutter/material.dart';
import 'dart:math';
import 'DerVitEmp.dart';

class PagJogo extends StatefulWidget {
  @override
  State<PagJogo> createState() => _PagJogoState();
}

//LÓGICA

class _PagJogoState extends State<PagJogo> {
  var opcoes = ['pedra', 'papel', 'tesoura', 'lagarto', 'spock'];
  String mensagem = 'Escolha do jogador: ';

  var imagemEsco = AssetImage('assets/imagens/fundoE.png');
  var imagPedra = AssetImage('assets/imagens/pedra.png');
  var imagPapel = AssetImage('assets/imagens/papel.png');
  var imagTesoura = AssetImage('assets/imagens/tesoura.png');
  var imagLagarto = AssetImage('assets/imagens/lagarto.png');
  var imagSpock = AssetImage('assets/imagens/spock.png');

  void Jogada(String escolha) {
    int o = Random().nextInt(4);
    String aleatorio = opcoes[o];

    imagemEsco = AssetImage('assets/imagens/$aleatorio.png');

    print('TOQUE:$escolha, Random: $aleatorio');

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
        mensagem == derrota();
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
        mensagem == vitoria();
      });
    } else {
      //empate
      setState(() {
        mensagem == empate();
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
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              'PC:',
            ),
          ),
          Image(image: imagemEsco, height: 100),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              mensagem,
            ),
          ),
          //
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Jogada('pedra'),
                child: Image(image: imagPedra, height: 100),
              ),
              GestureDetector(
                onTap: () => Jogada('papel'),
                child: Image(image: imagPapel, height: 100),
              ),
            ],
          ),
          //
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Jogada('tesoura'),
                child: Image(image: imagTesoura, height: 100),
              ),
            ],
          ),
          //
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Jogada('lagarto'),
                child: Image(image: imagLagarto, height: 100),
              ),
              GestureDetector(
                onTap: () => Jogada('spock'),
                child: Image(image: imagSpock, height: 100),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
