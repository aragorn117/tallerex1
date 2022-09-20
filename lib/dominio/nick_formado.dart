class NickFormado {
  late final String valor;
  NickFormado._(this.valor);

  //el ._ sirve para esconder un constructor //

  factory NickFormado.constructor(String propuesta) {
    if (propuesta.trim().isEmpty) {
      throw ('Nick mal formado ');
    }
    return NickFormado._(propuesta);
  }
}
