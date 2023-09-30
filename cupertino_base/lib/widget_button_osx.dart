import 'package:flutter/material.dart';

enum ButtonStyleOSX { action, normal, destructive }

class ButtonOSX extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;
  final ButtonStyleOSX style;
  final bool isLarge;

  const ButtonOSX({
    Key? key,
    required this.onPressed,
    required this.child,
    this.style = ButtonStyleOSX.normal, // per defecte
    this.isLarge = false, // per defecte
  }) : super(key: key);

  @override
  ButtonOSXState createState() => ButtonOSXState();
}

class ButtonOSXState extends State<ButtonOSX> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    BoxDecoration decoration;
    TextStyle textStyle;

    switch (widget.style) {
      case ButtonStyleOSX.action:
        decoration = BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              _isPressed
                  ? const Color.fromARGB(255, 25, 124, 245)
                  : const Color.fromARGB(255, 35, 134, 255),
              _isPressed
                  ? const Color.fromARGB(255, 0, 98, 236)
                  : const Color.fromARGB(255, 0, 111, 254),
            ],
          ),
          borderRadius: BorderRadius.circular(8.0),
        );
        textStyle = TextStyle(
          fontSize: 14,
          color: _isPressed
              ? const Color.fromARGB(255, 175, 211, 255)
              : Colors.white,
        );
        break;

      case ButtonStyleOSX.destructive:
        decoration = BoxDecoration(
          color: _isPressed ? Colors.grey.shade200 : Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8.0),
        );
        textStyle = const TextStyle(
          fontSize: 14,
          color: Colors.red,
        );
        break;

      default:
        decoration = BoxDecoration(
          color: _isPressed ? Colors.grey.shade200 : Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8.0),
        );
        textStyle = const TextStyle(
          fontSize: 14,
          color: Colors.black,
        );
    }

    return GestureDetector(
      onTapDown: (details) => setState(() => _isPressed = true),
      onTapUp: (details) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onPressed,
      child: DecoratedBox(
        decoration: decoration,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: DefaultTextStyle(
            style: textStyle,
            child: widget.isLarge
                ? Expanded(child: Center(child: widget.child))
                : widget.child,
          ),
        ),
      ),
    );
  }
}
