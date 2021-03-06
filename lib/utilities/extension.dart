extension $String on String {
  bool isValidEmail() => RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this);
}

extension $Iterable<E> on Iterable<E> {
  E? get firstOrNull {
    if(isNotEmpty) return first;
    return null;
  }

  E? get lastOrNull {
    if(isNotEmpty) return last;
    return null;
  }
}

extension $StringNullable on String? {
  bool get isNullOrEmpty => this == null || this == '';

  bool get isNotNullOrEmpty => this != null || this != '';
}

extension $Object on Object? {
  bool get isNull => this == null;

  bool get isNotNull => this != null;
}