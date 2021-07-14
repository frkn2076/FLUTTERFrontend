import 'package:flutter_test/flutter_test.dart';
import 'package:flutterfrontend/business/textValidator.dart';

void main() {
  test('Checks given items name whether its length is bigger than or equal to 2.', () {
    expect(TextValidator().isLengthEnough("F"), false);
    expect(TextValidator().isLengthEnough("Read book"), true);
  });
}
