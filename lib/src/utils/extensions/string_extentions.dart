extension ReturnString on String? {
  String get orEmpty => this ?? "";
}

extension Capitalize on String {
  String get capitalize {
    return isEmpty ?this : this[0].toUpperCase() + substring(1);
  }
}
