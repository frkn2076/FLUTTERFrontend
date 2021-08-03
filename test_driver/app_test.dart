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

  test(
      'Given Empty Todo list' +
          ' When I write "read book" to <text box> and click to <add button>' +
          ' Then I should see "read book" item in ToDo list', () async {
    final itemText = find.byValueKey("Item-Name");
    await driver?.waitFor(itemText);
    await Future<void>.delayed(
        Duration(milliseconds: 750)); // for video capture
    await driver?.tap(itemText);
    await driver?.enterText('read book');
    await driver?.waitFor(find.text('read book'));
    expect(await driver?.getText(itemText), 'read book');

    final addButton = find.byValueKey("Item-Button");
    await driver?.waitFor(addButton);
    await Future<void>.delayed(
        Duration(milliseconds: 750)); // for video capture
    await driver?.tap(addButton);
    expect(await driver?.getText(itemText), '');
  });

  test(
      'Given With Filled Todo list' +
          ' When I click to <delete all button>' +
          ' Then I should see all items deleted on the list', () async {
    final deleteAllButton = find.byValueKey("DeleteAll-Button");
    await driver?.waitFor(deleteAllButton);
    await Future<void>.delayed(Duration(milliseconds: 750)); // for video capture
    await driver?.tap(deleteAllButton);
    expect(true, false);
  });
}
