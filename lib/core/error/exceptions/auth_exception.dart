class AuthException implements Exception {
  final Status status;

  AuthException(this.status);

  @override
  String toString() {
    return this.status.toString();
  }
}

enum Status { Error, Cancelled }
