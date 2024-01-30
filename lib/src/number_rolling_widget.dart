import 'package:flutter/material.dart';

class NumberRollingWidget extends StatefulWidget {
  final int endValue;

  NumberRollingWidget({required this.endValue});

  @override
  _NumberRollingWidgetState createState() => _NumberRollingWidgetState();
}

class _NumberRollingWidgetState extends State<NumberRollingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<int>> _animations;
  late int _currentValue;

  @override
  void initState() {
    super.initState();

    _currentValue = widget.endValue;

    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _controller.addListener(() {
      setState(() {});
    });

    _updateAnimations(); // 初始化时设置动画
  }

  @override
  void didUpdateWidget(covariant NumberRollingWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.endValue != widget.endValue) {
      _currentValue = widget.endValue;
      _updateAnimations(); // 当 endValue 改变时更新动画
      _controller.forward(from: 0); // 从头开始播放动画
    }
  }

  void _updateAnimations() {
    List<int> startDigits = _currentValue
        .toString()
        .split('')
        .map((String digit) => int.parse(digit))
        .toList();
    List<int> endDigits = widget.endValue
        .toString()
        .split('')
        .map((String digit) => int.parse(digit))
        .toList();

    List<Animation<int>> newAnimations = [];

    int maxLength = startDigits.length > endDigits.length
        ? startDigits.length
        : endDigits.length;

    for (int i = 0; i < maxLength; i++) {
      int startDigit = i < startDigits.length ? startDigits[i] : 0;
      int endDigit = i < endDigits.length ? endDigits[i] : 0;

      Animation<int> animation = IntTween(
        begin: startDigit,
        end: endDigit,
      ).animate(_controller);

      newAnimations.add(animation);
    }

    _animations = newAnimations;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_animations.length, (index) {
        return AnimatedBuilder(
          animation: _animations[index],
          builder: (context, child) {
            return Text(
              _animations[index].value.toString(),
              style: TextStyle(fontSize: 14),
            );
          },
        );
      }),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
