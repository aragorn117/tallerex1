import 'package:flutter_test/flutter_test.dart';
import 'package:tallerex1/caracteristicas/repositorio_verificacion.dart';
import 'package:tallerex1/dominio/nick_formado.dart';
import 'package:tallerex1/dominio/problemas.dart';
import 'package:tallerex1/dominio/registro_usuario.dart';

void main() {
  group('pruebas verificacion offline', () {
    test('con benthor me regresa valor', () {
      RepositorioPruebasVerificacion repositorio =
          RepositorioPruebasVerificacion();

      var resultado = repositorio
          .obtenerRegistroUsuario(NickFormado.constructor('benthor'));
      resultado.match((l) {
        expect(false, equals(true));
      }, ((r) {
        expect(r.anioRegistro, equals(2012));
        expect(r.nombre, equals('Benthor'));
        expect(r.apellido, equals('Benthor'));
        expect(r.estado, equals(mensajeCampoVacio));
        expect(r.pais, equals(mensajeCampoVacio));
      }));
    });
    ////////////////////////////////////////////////
    test('con amlo me regresa error', () {
      RepositorioPruebasVerificacion repositorio =
          RepositorioPruebasVerificacion();

      var resultado =
          repositorio.obtenerRegistroUsuario(NickFormado.constructor('amlo'));

      resultado.match((l) {
        expect(true, equals(true));
      }, (r) {
        expect(true, equals(false));
      });
    });
    ///////////////////////////////////////////////////////
    test('con xml incorrecto', () {
      RepositorioPruebasVerificacion repositorio =
          RepositorioPruebasVerificacion();

      var resultado = repositorio
          .obtenerRegistroUsuario(NickFormado.constructor('incorrecto'));
      resultado.match((l) {
        expect(l, isA<versionIncorrectaXml>());
      }, (r) {
        assert(false);
      });
    });
  });
}
