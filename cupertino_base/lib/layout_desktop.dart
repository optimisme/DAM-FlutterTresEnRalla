import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                        style: TextStyle(fontSize: 20),
                    ),
                    ],
                ),
            ),
            Padding(
                padding: const EdgeInsets.all(20),
                child: Container( // macOS style button
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                            Color.fromARGB(255,  35, 134, 255),
                            Color.fromARGB(255,   0, 111, 254),
                            ],
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: CupertinoButton(
                        minSize: 0,
                        onPressed: _incrementCounter,
                        padding: EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 6),
                        child: const Text(
                            'Increment',
                            style: TextStyle(
                            fontSize: 14,
                            color: Colors.white, // Color del text
                            ),
                        ),
                    ),
                ),
            )
          ],
        ),
      ),
    );
  }
}