import 'package:flutter/material.dart';
import 'package:play_ground/tic_tac_toe_home_screen.dart';
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
