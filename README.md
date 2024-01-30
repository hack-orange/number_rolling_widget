<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features

- Beautiful Number Animations
- Customizable Duration
- Seamless Integration
- Supports Any Number Range

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart
import 'package:flutter/material.dart';
import 'package:number_rolling_widget/number_rolling_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Number Rolling Widget Example'),
        ),
        body: Center(
          child: NumberRollingWidgetExample(),
        ),
      ),
    );
  }
}

class NumberRollingWidgetExample extends StatefulWidget {
  @override
  _NumberRollingWidgetExampleState createState() => _NumberRollingWidgetExampleState();
}

class _NumberRollingWidgetExampleState extends State<NumberRollingWidgetExample> {
  int _targetValue = 123;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Target Value: $_targetValue',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 20),
        NumberRollingWidget(endValue: _targetValue),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _targetValue += 100; // Change the target value for demonstration
            });
          },
          child: Text('Change Target Value'),
        ),
      ],
    );
  }
}

```

## Additional information

additional_information:
# 使用指南
usage_guidelines: |
To use the `NumberRollingWidget`, simply add it to your widget tree and provide
the `endValue` property. You can customize the animation duration, and the widget
will smoothly transition to the specified number.

# 贡献指南
contributing_guidelines: |
Contributions are welcome! If you have any issues or feature requests, please
open an issue on GitHub. Pull requests are also appreciated.

# 许可证信息
license: MIT
