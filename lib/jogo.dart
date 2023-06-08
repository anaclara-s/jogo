import 'package:flutter/material.dart';
import 'dart:math';

class PagJogo extends StatefulWidget {
  @override
  State<PagJogo> createState() => _PagJogoState();
}

//LÓGICA

class _PagJogoState extends State<PagJogo> {
  var opcoes = ['pedra', 'papel', 'tesoura', 'lagarto', 'spock'];
  var mensagem = ' ';

  var imEscoPC = const AssetImage('assets/imagens/fundoE.png');
  var imEscoUSER = const AssetImage('assets/imagens/fundoE.png');
  var imagPedra = const AssetImage('assets/imagens/pedra.png');
  var imagPapel = const AssetImage('assets/imagens/papel.png');
  var imagTesoura = const AssetImage('assets/imagens/tesoura.png');
  var imagLagarto = const AssetImage('assets/imagens/lagarto.png');
  var imagSpock = const AssetImage('assets/imagens/spock.png');

  void Jogada(String escolha) {
    int a = Random().nextInt(4);
    String aleatorio = opcoes[a];

    imEscoPC = AssetImage('assets/imagens/$aleatorio.png');
    imEscoUSER = AssetImage('assets/imagens/$escolha.png');

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
        mensagem = 'derrota';
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
        mensagem = 'vitoria';
      });
    } else {
      //empate
      setState(() {
        mensagem = 'empate';
      });
    }
  }

//BODY

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(top: 10, bottom: 20),
            child: Text(
              'PC:',
            ),
          ),
          Image(image: imEscoPC, height: 120),
          //
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              'Escolha do jogador: ',
            ),
          ),
          Image(image: imEscoUSER, height: 120),
          //
          Padding(
            padding: EdgeInsetsDirectional.all(10),
            child: Text(
              mensagem,
            ),
          ),
          //
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          // SizedBox(
          //   width: 150,
          //   height: 80,
          //   child:
          // ),
        ],
      ),
    );
  }
}
