import 'package:clean_architecture_core/utilities/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const testTimeOfDay = TimeOfDay(hour: 12, minute: 00);

  group('compareTo', () {
    test('this is ordered before other', () {
      const testTimeOfDayAfter = TimeOfDay(hour: 20, minute: 00);
      expect(testTimeOfDay.compareTo(testTimeOfDayAfter), equals(-1));
    });
    test('this is ordered after other', () {
      const testTimeOfDayBefore = TimeOfDay(hour: 8, minute: 00);
      expect(testTimeOfDay.compareTo(testTimeOfDayBefore), equals(1));
    });
    test('this and other are ordered together', () {
      const testTimeOfDayTogether = TimeOfDay(hour: 12, minute: 00);
      expect(testTimeOfDay.compareTo(testTimeOfDayTogether), equals(0));
    });
  });

  test('this is ordered before other', () {
    const testTimeOfDayAfter = TimeOfDay(hour: 20, minute: 00);
    const testTimeOfDayBefore = TimeOfDay(hour: 8, minute: 00);
    const testTimeOfDayTogether = TimeOfDay(hour: 12, minute: 00);
    expect(testTimeOfDay.isBefore(testTimeOfDayAfter), true);
    expect(testTimeOfDay.isBefore(testTimeOfDayBefore), false);
    expect(testTimeOfDay.isBefore(testTimeOfDayTogether), false);
  });

  test('this is ordered after other', () {
    const testTimeOfDayAfter = TimeOfDay(hour: 20, minute: 00);
    const testTimeOfDayBefore = TimeOfDay(hour: 8, minute: 00);
    const testTimeOfDayTogether = TimeOfDay(hour: 12, minute: 00);
    expect(testTimeOfDay.isAfter(testTimeOfDayAfter), false);
    expect(testTimeOfDay.isAfter(testTimeOfDayBefore), true);
    expect(testTimeOfDay.isAfter(testTimeOfDayTogether), false);
  });

  test('this and other are ordered together', () {
    const testTimeOfDayAfter = TimeOfDay(hour: 20, minute: 00);
    const testTimeOfDayBefore = TimeOfDay(hour: 8, minute: 00);
    const testTimeOfDayTogether = TimeOfDay(hour: 12, minute: 00);
    expect(testTimeOfDay.isSame(testTimeOfDayAfter), false);
    expect(testTimeOfDay.isSame(testTimeOfDayBefore), false);
    expect(testTimeOfDay.isSame(testTimeOfDayTogether), true);
  });

  group('this is ordered after start and before end', () {
    test('lower limit', () {
      const testTimeOfDayStart = TimeOfDay(hour: 12, minute: 00);
      const testTimeOfDayEnd = TimeOfDay(hour: 20, minute: 00);
      expect(
          testTimeOfDay.isBetween(testTimeOfDayStart, testTimeOfDayEnd), false);
    });

    test('upper limit', () {
      const testTimeOfDayStart = TimeOfDay(hour: 8, minute: 00);
      const testTimeOfDayEnd = TimeOfDay(hour: 12, minute: 00);
      expect(
          testTimeOfDay.isBetween(testTimeOfDayStart, testTimeOfDayEnd), false);
    });

    test('in range', () {
      const testTimeOfDayStart = TimeOfDay(hour: 8, minute: 00);
      const testTimeOfDayEnd = TimeOfDay(hour: 18, minute: 00);
      expect(
          testTimeOfDay.isBetween(testTimeOfDayStart, testTimeOfDayEnd), true);
    });

    test('outside lower limit', () {
      const testTimeOfDayStart = TimeOfDay(hour: 18, minute: 00);
      const testTimeOfDayEnd = TimeOfDay(hour: 20, minute: 00);
      expect(
          testTimeOfDay.isBetween(testTimeOfDayStart, testTimeOfDayEnd), false);
    });

    test('outside upper limit', () {
      const testTimeOfDayStart = TimeOfDay(hour: 6, minute: 00);
      const testTimeOfDayEnd = TimeOfDay(hour: 10, minute: 00);
      expect(
          testTimeOfDay.isBetween(testTimeOfDayStart, testTimeOfDayEnd), false);
    });
  });

  group('this is ordered after or together start and before or together end ',
      () {
    test('lower limit', () {
      const testTimeOfDayStart = TimeOfDay(hour: 12, minute: 00);
      const testTimeOfDayEnd = TimeOfDay(hour: 20, minute: 00);
      expect(
          testTimeOfDay.isBetweenInclusive(
              testTimeOfDayStart, testTimeOfDayEnd),
          true);
    });

    test('upper limit', () {
      const testTimeOfDayStart = TimeOfDay(hour: 8, minute: 00);
      const testTimeOfDayEnd = TimeOfDay(hour: 12, minute: 00);
      expect(
          testTimeOfDay.isBetweenInclusive(
              testTimeOfDayStart, testTimeOfDayEnd),
          true);
    });

    test('in range', () {
      const testTimeOfDayStart = TimeOfDay(hour: 8, minute: 00);
      const testTimeOfDayEnd = TimeOfDay(hour: 18, minute: 00);
      expect(
          testTimeOfDay.isBetweenInclusive(
              testTimeOfDayStart, testTimeOfDayEnd),
          true);
    });

    test('outside lower limit', () {
      const testTimeOfDayStart = TimeOfDay(hour: 18, minute: 00);
      const testTimeOfDayEnd = TimeOfDay(hour: 20, minute: 00);
      expect(
          testTimeOfDay.isBetween(testTimeOfDayStart, testTimeOfDayEnd), false);
    });

    test('outside upper limit', () {
      const testTimeOfDayStart = TimeOfDay(hour: 6, minute: 00);
      const testTimeOfDayEnd = TimeOfDay(hour: 10, minute: 00);
      expect(
          testTimeOfDay.isBetween(testTimeOfDayStart, testTimeOfDayEnd), false);
    });
  });
}
