// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'package:test/test.dart';
import '../lib/helpers/UrlHelper.dart';

void main() {
  test('test url with a space', () {
    var answer = UrlHelper.parse('https://123 45');
    expect(answer, 'https://123%2045');
  });
}
