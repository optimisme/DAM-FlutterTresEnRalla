import 'dart:math';
import 'package:flutter/material.dart'; // per a 'CustomPainter'
import 'app_data.dart';

class CanvasPainter extends CustomPainter {
  final AppData appData;

  CanvasPainter(this.appData);

  void drawBoardLines(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 5.0;

    // Definim els punts on es creuaran les línies verticals
    final double firstVertical = size.width / 3;
    final double secondVertical = 2 * size.width / 3;

    // Dibuixem les línies verticals
    canvas.drawLine(
        Offset(firstVertical, 0), Offset(firstVertical, size.height), paint);
    canvas.drawLine(
        Offset(secondVertical, 0), Offset(secondVertical, size.height), paint);

    // Definim els punts on es creuaran les línies horitzontals
    final double firstHorizontal = size.height / 3;
    final double secondHorizontal = 2 * size.height / 3;

    // Dibuixem les línies horitzontals
    canvas.drawLine(
        Offset(0, firstHorizontal), Offset(size.width, firstHorizontal), paint);
    canvas.drawLine(Offset(0, secondHorizontal),
        Offset(size.width, secondHorizontal), paint);
  }

  void drawBoardStatus(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 5.0;

    // Dibuixar 'X' i 'O' del tauler
    double cellWidth = size.width / 3;
    double cellHeight = size.height / 3;

    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (appData.board[i][j] == 'X') {
          // Dibuixar una X amb el color del jugador
          Color color = Colors.blue;
          switch (appData.colorPlayer) {
            case "Blau":
              color = Colors.blue;
              break;
            case "Verd":
              color = Colors.green;
              break;
            case "Gris":
              color = Colors.grey;
              break;
          }
          paint.color = color;
          canvas.drawLine(
            Offset(j * cellWidth, i * cellHeight),
            Offset((j + 1) * cellWidth, (i + 1) * cellHeight),
            paint,
          );
          canvas.drawLine(
            Offset((j + 1) * cellWidth, i * cellHeight),
            Offset(j * cellWidth, (i + 1) * cellHeight),
            paint,
          );
        } else if (appData.board[i][j] == 'O') {
          // Dibuixar una O amb el color de l'oponent
          Color color = Colors.blue;
          switch (appData.colorOpponent) {
            case "Vermell":
              color = Colors.red;
              break;
            case "Taronja":
              color = Colors.orange;
              break;
            case "Marró":
              color = Colors.brown;
              break;
          }
          paint.color = color;
          double minDimension = min(cellWidth, cellHeight);
          double circleRadius = minDimension / 2;

          double centerX = j * cellWidth + cellWidth / 2;
          double centerY = i * cellHeight + cellHeight / 2;

          canvas.drawCircle(
            Offset(centerX, centerY),
            circleRadius,
            paint,
          );
        }
      }
    }
  }

  void drawGameOver(Canvas canvas, Size size) {
    String message = "El joc ha acabat. Ha guanyat ${appData.gameWinner}!";

    const textStyle = TextStyle(
      color: Colors.black,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    );

    final textPainter = TextPainter(
      text: TextSpan(text: message, style: textStyle),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(
      maxWidth: size.width,
    );

    // Centrem el text en el canvas
    final position = Offset(
      (size.width - textPainter.width) / 2,
      (size.height - textPainter.height) / 2,
    );

    // Dibuixar un rectangle semi-transparent que ocupi tot l'espai del canvas
    final bgRect = Rect.fromLTWH(0, 0, size.width, size.height);
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.7) // Ajusta l'opacitat com vulguis
      ..style = PaintingStyle.fill;

    canvas.drawRect(bgRect, paint);

    // Ara, dibuixar el text
    textPainter.paint(canvas, position);
  }

  @override
  void paint(Canvas canvas, Size size) {
    drawBoardLines(canvas, size);
    drawBoardStatus(canvas, size);
    if (appData.gameWinner != '-') {
      drawGameOver(canvas, size);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
