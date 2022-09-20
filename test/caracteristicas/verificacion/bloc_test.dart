import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tallerex1/caracteristicas/bloc.dart';

void main() {
  blocTest<BlocVerificacion, EstadoVerificacion>(
    'emits [MyState] when MyEvent is added.',
    build: () => BlocVerificacion(),
    act: (bloc) => bloc.add(Creado()),
    expect: () => [isA<SolicitandoNombre>()],
  );
}
