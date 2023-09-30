import 'package:flutter/cupertino.dart';
import 'package:nintendo_db/widget_button_osx.dart';

class LayoutDesktop extends StatefulWidget {
  const LayoutDesktop({super.key, required this.title});

  final String title;

  @override
  State<LayoutDesktop> createState() => _LayoutDesktopState();
}

class _LayoutDesktopState extends State<LayoutDesktop> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.title),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  // Add text with the counter
                  Text(
                    ' $_counter',
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ButtonOSX(
                style: ButtonStyleOSX.action,
                isLarge: false,
                onPressed: _incrementCounter,
                child: const Text('Increment'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
