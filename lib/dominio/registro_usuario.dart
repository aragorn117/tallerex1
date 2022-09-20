const String mensajeRegistroUsuarioError = 'Error en el registro de usuario';
const String mensajeCampoVacio = 'sin valor';

class RegistroUsuario {
  late final int anioRegistro;
  late final String nombre;
  late final String apellido;
  late final String pais;
  late final String estado;

  RegistroUsuario._(
      {required this.anioRegistro,
      required this.nombre,
      required this.apellido,
      required this.pais,
      required this.estado});
  factory RegistroUsuario.constructor(
      {required String propuestaAnio,
      required String propuestaNombre,
      required String propuestaApellido,
      required String propuestaPais,
      required String propuestaEstado}) {
    int? valorAnio = int.tryParse(propuestaAnio);
    if (valorAnio == null) {
      throw mensajeRegistroUsuarioError;
    }
    if (propuestaNombre.trim().isEmpty) {
      throw mensajeRegistroUsuarioError;
    }
    propuestaApellido = propuestaApellido.trim().isEmpty
        ? mensajeCampoVacio
        : propuestaApellido;
    propuestaPais =
        propuestaPais.trim().isEmpty ? mensajeCampoVacio : propuestaPais;
    propuestaEstado =
        propuestaEstado.trim().isEmpty ? mensajeCampoVacio : propuestaEstado;

    final resultado = RegistroUsuario._(
        anioRegistro: valorAnio,
        nombre: propuestaNombre,
        apellido: propuestaApellido,
        pais: propuestaPais,
        estado: propuestaEstado);
    return resultado;
  }
}
