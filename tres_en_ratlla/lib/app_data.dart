import 'package:flutter/material.dart';

class AppData with ChangeNotifier {
  // App status
  String colorPlayer = "Verd";
  String colorOpponent = "Taronja";

  List<List<String>> board = [];
  bool gameIsOver = false;
  String gameWinner = '-';

  void resetGame() {
    board = [
      ['-', '-', '-'],
      ['-', '-', '-'],
      ['-', '-', '-'],
    ];
    gameIsOver = false;
    gameWinner = '-';
  }

  void playMove(int row, int col) {
    if (board[row][col] == '-') {
      board[row][col] = 'X';
      checkGameWinner();
      if (gameWinner == '-') {
        machinePlay();
      }
    }
  }

  void machinePlay() {
    bool moveMade = false;

    // Buscar una casella lliure '-'
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j] == '-') {
          board[i][j] = 'O';
          moveMade = true;
          break;
        }
      }
      if (moveMade) break;
    }

    checkGameWinner();
  }

  void checkGameWinner() {
    for (int i = 0; i < 3; i++) {
      // Comprovar files
      if (board[i][0] == board[i][1] &&
          board[i][1] == board[i][2] &&
          board[i][0] != '-') {
        gameIsOver = true;
        gameWinner = board[i][0];
        return;
      }

      // Comprovar columnes
      if (board[0][i] == board[1][i] &&
          board[1][i] == board[2][i] &&
          board[0][i] != '-') {
        gameIsOver = true;
        gameWinner = board[0][i];
        return;
      }
    }

    // Comprovar diagonal principal
    if (board[0][0] == board[1][1] &&
        board[1][1] == board[2][2] &&
        board[0][0] != '-') {
      gameIsOver = true;
      gameWinner = board[0][0];
      return;
    }

    // Comprovar diagonal secundària
    if (board[0][2] == board[1][1] &&
        board[1][1] == board[2][0] &&
        board[0][2] != '-') {
      gameIsOver = true;
      gameWinner = board[0][2];
      return;
    }

    gameWinner = '-';
  }
}
