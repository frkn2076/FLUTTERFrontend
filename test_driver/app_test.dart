import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  FlutterDriver? driver;

  // Connect to the Flutter driver before running any tests.
  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  // Close the connection to the driver after the tests have completed.
  tearDownAll(() async {
    if (driver != null) {
      driver?.close();
    }
  });

  test('Given Empty Todo list' +
       'When I write "read book" to <text box> and click to <add button>' +
       'Then I should see "read book" item in ToDo list', () async {

      // //dummy
      // final addButton = find.byTooltip('Increment');
      // await driver?.waitFor(addButton);
      // await driver?.tap(addButton);
      // //

      final itemText = find.byValueKey('ItemText');
      // waitFor gerekebilir
      await driver?.tap(itemText); // acquire focus
      await driver?.enterText('read book');  // enter text
      await driver?.waitFor(find.text('read book')); // verify text appears on UI
      expect(await driver?.getText(itemText), 'read book');

      final addButton = find.byValueKey("AddButton");
      await driver?.waitFor(addButton);
      await Future<void>.delayed(Duration(milliseconds: 750)); // for video capture
      await driver?.tap(addButton);

  });
}

