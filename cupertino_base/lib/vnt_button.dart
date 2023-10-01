import 'package:flutter/material.dart';

enum VNTButtonStyle { action, normal, destructive }

class VNTButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;
  final VNTButtonStyle style;
  final bool isLarge;

  const VNTButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.style = VNTButtonStyle.normal, // per defecte
    this.isLarge = false, // per defecte
  }) : super(key: key);

  @override
  VNTButtonState createState() => VNTButtonState();
}

class VNTButtonState extends State<VNTButton> {
  static const double _fontSize = 12.0;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    BoxDecoration decoration;
    TextStyle textStyle;

    switch (widget.style) {
      case VNTButtonStyle.action:
        decoration = BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              _isPressed
                  ? const Color.fromRGBO(25, 124, 245, 1)
                  : const Color.fromRGBO(35, 134, 255, 1),
              _isPressed
                  ? const Color.fromRGBO(0, 98, 236, 1)
                  : const Color.fromRGBO(0, 111, 254, 1),
            ],
          ),
          borderRadius: BorderRadius.circular(8.0),
        );
        textStyle = TextStyle(
          fontSize: _fontSize,
          color: _isPressed
              ? const Color.fromRGBO(175, 211, 255, 1)
              : Colors.white,
        );
        break;

      case VNTButtonStyle.destructive:
        decoration = BoxDecoration(
          color: _isPressed ? Colors.grey.shade200 : Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8.0),
        );
        textStyle = const TextStyle(
          fontSize: _fontSize,
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
          fontSize: _fontSize,
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
          padding: widget.isLarge
              ? const EdgeInsets.fromLTRB(8, 8, 8, 10)
              : const EdgeInsets.fromLTRB(8, 4, 8, 6),
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
