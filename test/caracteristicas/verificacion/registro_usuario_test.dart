import 'package:flutter_test/flutter_test.dart';
import 'package:tallerex1/dominio/registro_usuario.dart';

void main() {
  group('registro usuario correcto', () {
    test('prueba', () {
      final RegistroUsuario r = RegistroUsuario.constructor(
          propuestaAnio: '2012',
          propuestaNombre: 'x',
          propuestaApellido: 's',
          propuestaPais: 'x',
          propuestaEstado: 'xc');
      expect(r.anioRegistro, equals(2012));
    });
  });
}
