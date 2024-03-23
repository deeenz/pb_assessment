extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String shortToLength(int length) {
    if (length > length) {
      return "${substring(0, length - 1)}...";
    }

    return this;
  }

  String removeHTML() {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    String parsedstring = replaceAll(exp, '');

    return parsedstring;
  }

  String get capitalizeFirstOfEach {
    return split(" ").map((str) => str.capitalize()).join(" ");
  }
}

extension CustomIterable<T> on Iterable<T> {
  T? get secondToLast {
    return length < 2 ? null : elementAt(length - 2);
  }
}