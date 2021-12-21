import 'package:clean_architecture_core/utilities/extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('formatWithoutDecimalZero', () {
    test('Is whole number with 1 decimal', () {
      expect(10.0.formatWithoutDecimalZero(1), '10');
    });
    test('double has minus decimals than decimals to display', () {
      expect(10.12.formatWithoutDecimalZero(3), '10.120');
    });
    test('double has more decimals than decimals to display', () {
      expect(10.1234.formatWithoutDecimalZero(3), '10.123');
    });
  });
}
