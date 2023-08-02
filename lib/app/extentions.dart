// ignore: camel_case_extensions
extension nonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return "";
    } else {
      return this!;
    }
  }
}
// ignore: camel_case_extensions
extension nonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return 0;
    } else {
      return this!;
    }
  }
}
