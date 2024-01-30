import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:number_rolling/number_rolling.dart';

void main() {
  testWidgets('NumberRollingWidget displays correct value', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: NumberRollingWidget(endValue: 42),
      ),
    );
    expect(find.text('4'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
    if (kDebugMode) {
      print('pass');
    }
  });
}
