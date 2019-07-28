// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:quiz/main.dart';

void main() {
  testWidgets('Quiz question test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(QuizApp());

    // Verify that our counter starts at 0.
    expect(find.text('What is your favorite color?'), findsOneWidget);
    expect(find.text('Black'), findsOneWidget);

    await tester.tap(find.text('Black'));
    await tester.pump();

    expect(find.text('What is your favorite animal?'), findsOneWidget);
    expect(find.text('Snake'), findsOneWidget);

    await tester.tap(find.text('Snake'));
    await tester.pump();

    expect(find.text('You are so bad...'), findsOneWidget);
    expect(find.text('Restart Quiz'), findsOneWidget);
  });
}
