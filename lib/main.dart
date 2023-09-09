import 'package:flutter/material.dart';
void main() => runApp(const TicTacToe());
class TicTacToe extends StatelessWidget {
  const TicTacToe({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TicTacToeHomePage(title: 'Tic Tac Toe'),
    );
  }
}
class TicTacToeHomePage extends StatefulWidget {
  const TicTacToeHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _TicTacToeHomePageState createState() => _TicTacToeHomePageState();
}
class _TicTacToeHomePageState extends State<TicTacToeHomePage> {
  List<String?> _gameBoard = List.generate(9, (index) => null);
  bool _player1Turn = true;
  String? _winner;
  void _makeMove(int index) {
    setState(() {
      if (_gameBoard[index] == null) {
        if (_player1Turn) {
          _gameBoard[index] = "X";
        } else {
          _gameBoard[index] = "O";
        }
        _player1Turn = !_player1Turn;
        _checkForWinner();
      }
    });
  }
  void _checkForWinner() {
    // Check rows
    for (int i = 0; i < 9; i += 3) {
      if (_gameBoard[i] != null &&
          _gameBoard[i] == _gameBoard[i + 1] &&
          _gameBoard[i] == _gameBoard[i + 2]) {
        _winner = _gameBoard[i];
      }
    }
    // Check columns
    for (int i = 0; i < 3; i++) {
      if (_gameBoard[i] != null &&
          _gameBoard[i] == _gameBoard[i + 3] &&
          _gameBoard[i] == _gameBoard[i + 6]) {
        _winner = _gameBoard[i];
      }
    }
    // Check diagonals
    if (_gameBoard[0] != null &&
        _gameBoard[0] == _gameBoard[4] &&
        _gameBoard[0] == _gameBoard[8]) {
      _winner = _gameBoard[0];
    }
    if (_gameBoard[2] != null &&
        _gameBoard[2] == _gameBoard[4] &&
        _gameBoard[2] == _gameBoard[6]) {
      _winner = _gameBoard[2];
    }
    // Check for draw
    if (!_gameBoard.contains(null) && _winner == null) {
      _winner = "Draw";
    }
  }
  void _resetGame() {
    setState(() {
      _gameBoard = List.generate(9, (index) => null);
      _player1Turn = true;
      _winner = null;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,

      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(widget.title),
      //
      // ),
      body: Padding(
        padding: const EdgeInsets.only(top: 80.0,bottom: 20),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _makeMove(index),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue[300],
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          _gameBoard[index] ?? "",
                          style: TextStyle(fontSize: 48),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            if (_winner != null)
              Column(
                children: [
                  Text(
                    _winner == "Draw" ? "It's a draw!" : "Winner: $_winner",
                    style: const TextStyle(fontSize: 30,color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    //height: 40,

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[300],
                      ),
                      onPressed: _resetGame,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Text("Play Again",
                        style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}