// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutterfrontend/main.dart';
import 'package:flutterfrontend/util/API.dart';

void main() {
  testWidgets('Item text box smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp(client: API()));
    final inputText = 'read book';
    final itemText = find.byKey(Key("Item-Name"));
    
    expect(itemText, findsOneWidget);
    expect(find.text(inputText), findsNothing);
    
    await tester.enterText(itemText, inputText);
    expect(find.text(inputText), findsOneWidget);
  });

  testWidgets('DataTable keeps items smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp(client: API()));

    final itemList = find.byKey(Key("Item-List"));
    expect(itemList, findsOneWidget);
  });

  testWidgets('Add button adds item smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp(client: API()));

    final inputText = 'read book';
    expect(find.widgetWithText(DataTable, inputText), findsNothing);
    final itemText = find.byKey(Key("Item-Name"));
    await tester.enterText(itemText, inputText);

    final addButton = find.byKey(Key("Item-Button"));
    expect(addButton, findsOneWidget);
    await tester.tap(addButton);
    await tester.pump();

    expect(find.widgetWithText(DataTable, inputText), findsOneWidget);
  });
}

