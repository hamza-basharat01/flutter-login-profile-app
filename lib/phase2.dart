import 'package:flutter/material.dart';

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({super.key});

  @override
  State<AnimatedContainerWidget> createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState
    extends State<AnimatedContainerWidget> {
  double _height = 100;
  double _width = 100;

  void _increaseWidth() {
    setState(() {
      _height += 20;
      _width += 20;

      // Reset dimensions to prevent unlimited growth
      if (_width > 250) {
        _height = 100;
        _width = 100;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 5000),
      curve: Curves.easeInOut,
      color: Colors.blue,
      height: _height,
      width: _width,
      child: Center(
        child: FloatingActionButton(
          onPressed: _increaseWidth,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}