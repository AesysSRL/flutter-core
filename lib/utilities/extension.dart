extension StringExtension on String {
  bool isValidEmail() => RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this);
}

extension $Iterable<E> on Iterable<E> {
  E get firstOrNull {
    if(isNotEmpty) return first;
    return null;
  }

  E get lastOrNull {
    if(isNotEmpty) return last;
    return null;
  }

  E firstWhereOrNull(bool Function(E element) test) {
    return firstWhere(test, orElse: () => null);
  }
}

extension $Number<E> on num {
  bool get isNull => this == null;

  bool get isNotNull => this != null;
}