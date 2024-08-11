class NoProductFoundException implements Exception {
  String mensaje;

  NoProductFoundException(this.mensaje);

  @override
  String toString() {
    return mensaje.toString();
  }
}
