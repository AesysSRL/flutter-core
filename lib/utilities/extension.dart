extension $String on String {
  bool get isValidEmail => RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this);
  bool get isValidUrl => RegExp(r'^(?:(?:(?:https?|ftp):)?\/\/)(?:\S+(?::\S*)?@)?(?:(?!(?:10|127)(?:\.\d{1,3}){3})(?!(?:169\.254|192\.168)(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z0-9\u00a1-\uffff][a-z0-9\u00a1-\uffff_-]{0,62})?[a-z0-9\u00a1-\uffff]\.)+(?:[a-z\u00a1-\uffff]{2,}\.?))(?::\d{2,5})?(?:[/?#]\S*)?$').hasMatch(this);
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
  void run<T>(void Function(T obj) call) {
    if(this is T && this != null) {
      call(this as T);
    }
  }
}