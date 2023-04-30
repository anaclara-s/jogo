import 'package:flutter/material.dart';

class derrota extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text(
          'DERROTA',
          style: TextStyle(
            color: Colors.red[900],
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}

class vitoria extends StatelessWidget {
  const vitoria({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text(
          'VITORIA',
          style: TextStyle(
            color: Colors.lightBlueAccent,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}

class empate extends StatelessWidget {
  const empate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text(
          'EMPATE',
          style: TextStyle(
            color: Colors.deepOrangeAccent,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
