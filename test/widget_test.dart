// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutterfrontend/main.dart';

void main() {
  testWidgets('Item text box smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    final inputText = 'read book';
    final itemText = find.byType(TextField);
    
    expect(itemText, findsOneWidget);
    expect(find.text(inputText), findsNothing);
    
    await tester.enterText(itemText, inputText);
    expect(find.text(inputText), findsOneWidget);
  });

  testWidgets('DataTable keeps items smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.byType(DataTable), findsOneWidget);
    expect(find.byType(DataColumn), findsOneWidget);
    expect(find.byType(DataRow), findsOneWidget);
    expect(find.byType(DataCell), findsOneWidget);
  });

  testWidgets('Add button adds item smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.byIcon(Icons.add), findsOneWidget);

    final inputText = 'read book';
    final itemText = find.byType(TextField);
    await tester.enterText(itemText, inputText);

    final addButton = find.byIcon(Icons.add); 
    await tester.tap(addButton);
    await tester.pump();

    expect(find.widgetWithText(DataCell, inputText), findsOneWidget);
  });

  

  

  
}

