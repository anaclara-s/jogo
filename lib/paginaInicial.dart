import 'package:flutter/material.dart';
import 'regras.dart';
import 'jogo.dart';

class PagIni extends StatelessWidget {
  static const appTitle = 'TEXTO';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PAGINA INICIAL')),
      body: Container(
        child: Center(
          child: Text(
            'CORPO',
            style: TextStyle(
                fontFamily: 'Times New Roman',
                color: Color.fromARGB(255, 63, 130, 181),
                fontSize: 25),
          ),
        ),
      ),

      //menu inicio
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 119, 179),
              ),
              child: Text('CABEÇALHO'),
            ),
            ListTile(
              title: const Text('Regras'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PagReg();
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Jogo'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PagJogo();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      //menu fim
    );
  }
}
