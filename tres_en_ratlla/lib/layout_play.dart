import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'app_data.dart';
import 'canvas_painter.dart';

class LayoutPlay extends StatefulWidget {
  const LayoutPlay({Key? key}) : super(key: key);

  @override
  LayoutPlayState createState() => LayoutPlayState();
}

class LayoutPlayState extends State<LayoutPlay> {
  @override
  Widget build(BuildContext context) {
    AppData appData = Provider.of<AppData>(context);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text("Partida"),
        leading: CupertinoNavigationBarBackButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      child: SafeArea(
        child: GestureDetector(
          onTapUp: (TapUpDetails details) {
            final int row =
                (details.localPosition.dy / (context.size!.height / 3)).floor();
            final int col =
                (details.localPosition.dx / (context.size!.width / 3)).floor();

            appData.playMove(row, col);
            setState(() {}); // Actualitza la vista
          },
          child: SizedBox(
            width: MediaQuery.of(context)
                .size
                .width, // Ocupa tot l'ample de la pantalla
            height: MediaQuery.of(context).size.height -
                56.0, // Ocupa tota l'altura disponible menys l'altura de l'AppBar
            child: CustomPaint(
              painter: CanvasPainter(appData),
            ),
          ),
        ),
      ),
    );
  }
}
