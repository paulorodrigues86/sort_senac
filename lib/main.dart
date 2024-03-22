import 'dart:math'; // Importação da biblioteca para gerar números aleatórios.

import 'package:flutter/material.dart'; // Importação do pacote de widgets do Flutter.

void main() {
  runApp(MyApp()); // Função principal que inicia o aplicativo Flutter.
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Widget MaterialApp que configura a aparência e o comportamento do aplicativo.
      title: 'Sorteio de Número', // Título do aplicativo.
      theme: ThemeData(
        primarySwatch: Colors.blue, // Cor primária do tema do aplicativo.
      ),
      home: MyHomePage(), // Define a página inicial do aplicativo.
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState(); // Cria o estado da página inicial.
}

class _MyHomePageState extends State<MyHomePage> {
  final _startController = TextEditingController(); // Controlador para o campo de entrada do número inicial.
  final _endController = TextEditingController(); // Controlador para o campo de entrada do número final.
  int _startNumber = 0; // Variável para armazenar o número inicial.
  int _endNumber = 100; // Variável para armazenar o número final.
  int _winner = 0; // Variável para armazenar o número sorteado.

  @override
  void dispose() {
    _startController.dispose(); // Libera os recursos do controlador do número inicial.
    _endController.dispose(); // Libera os recursos do controlador do número final.
    super.dispose();
  }

  void _selectWinner() {
    // Função para selecionar um número aleatório dentro do intervalo especificado.
    final random = Random(); // Objeto para gerar números aleatórios.
    setState(() {
      _winner = _startNumber + random.nextInt(_endNumber - _startNumber + 1); // Gera o número sorteado.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Widget Scaffold que define a estrutura básica da tela.
      appBar: AppBar(
        // Widget AppBar que cria a barra de aplicativo.
        title: Text('Sorteio de Número'), // Título da barra de aplicativo.
      ),
      body: Padding(
        // Widget Padding para adicionar espaço ao redor de outros widgets.
        padding: EdgeInsets.all(16.0), // Define o preenchimento interno de todos os lados.
        child: Column(
          // Widget Column para organizar os widgets em uma coluna.
          crossAxisAlignment: CrossAxisAlignment.stretch, // Alinha os widgets ao esticar a largura.
          children: <Widget>[
            // Lista de widgets filhos dentro da coluna.
            TextField(
              // Widget TextField para entrada de texto.
              controller: _startController, // Controlador para o campo de entrada do número inicial.
              keyboardType: TextInputType.number, // Tipo de teclado para aceitar apenas números.
              decoration: InputDecoration(
                labelText: 'Número inicial', // Rótulo para o campo de entrada do número inicial.
              ),
              onChanged: (value) {
                // Função chamada quando o valor do campo muda.
                setState(() {
                  _startNumber = int.tryParse(value) ?? 0; // Converte o valor para inteiro.
                });
              },
            ),
            TextField(
              // Widget TextField para entrada de texto.
              controller: _endController, // Controlador para o campo de entrada do número final.
              keyboardType: TextInputType.number, // Tipo de teclado para aceitar apenas números.
              decoration: InputDecoration(
                labelText: 'Número final', // Rótulo para o campo de entrada do número final.
              ),
              onChanged: (value) {
                // Função chamada quando o valor do campo muda.
                setState(() {
                  _endNumber = int.tryParse(value) ?? 100; // Converte o valor para inteiro.
                });
              },
            ),
            SizedBox(height: 16.0), // Espaçamento vertical entre os widgets.
            ElevatedButton(
              // Widget ElevatedButton para criar um botão elevado.
              onPressed: _selectWinner, // Função chamada quando o botão é pressionado.
              child: Text('Sortear Número'), // Texto exibido no botão.
            ),
            SizedBox(height: 16.0), // Espaçamento vertical entre os widgets.
            Text(
              // Widget Text para exibir texto na tela.
              'O número sorteado é: $_winner', // Texto exibido na tela.
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold), // Estilo do texto.
            ),
          ],
        ),
      ),
    );
  }
}
