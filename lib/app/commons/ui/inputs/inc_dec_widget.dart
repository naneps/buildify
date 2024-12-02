import 'dart:async';

import 'package:buildify/app/commons/themes/main_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class IncDecWidget extends StatefulWidget {
  final int min;
  final int max;
  int value;
  final int step;
  final Function(int value)? onValueChanged;

  IncDecWidget({
    super.key,
    this.min = 0,
    this.max = 100,
    this.value = 1,
    this.step = 1,
    this.onValueChanged,
  });

  @override
  State<IncDecWidget> createState() => _IncDecWidgetState();
}

class _IncDecWidgetState extends State<IncDecWidget> {
  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: _decrement,
          onLongPress: _startDecrementing,
          onLongPressUp: _stopTimer,
          child: Icon(
            Icons.remove,
            color: MainColors.dangerColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text("${widget.value}", style: const TextStyle(fontSize: 14)),
        ),
        GestureDetector(
          onTap: _increment,
          onLongPress: _startIncrementing,
          onLongPressUp: _stopTimer,
          child: Icon(
            Icons.add,
            color: MainColors.primaryColor,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.value > widget.max) {
      widget.value = widget.max;
    }
    if (widget.value < widget.min) {
      widget.value = widget.min;
    }
  }

  void _decrement() {
    setState(() {
      if (widget.value - widget.step >= widget.min) {
        widget.value -= widget.step;
        widget.onValueChanged?.call(widget.value);
      }
    });
  }

  void _increment() {
    setState(() {
      if (widget.value + widget.step <= widget.max) {
        widget.value += widget.step;
        widget.onValueChanged?.call(widget.value);
      }
    });
  }

  void _startDecrementing() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      _decrement();
    });
  }

  void _startIncrementing() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      _increment();
    });
  }

  void _stopTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
  }
}
