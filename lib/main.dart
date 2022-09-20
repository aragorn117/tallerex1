import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tallerex1/caracteristicas/verificacion/bloc.dart';
import 'package:tallerex1/caracteristicas/verificacion/vista/vista_creandose.dart';
import 'package:tallerex1/caracteristicas/verificacion/vista/vista_esperando_nombre.dart';

void main() {
  runApp(const AplicacionInyectada());
}

class AplicacionInyectada extends StatelessWidget {
  const AplicacionInyectada({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        BlocVerificacion blocVerificacion = BlocVerificacion();
        Future.delayed(const Duration(seconds: 2), () {
          blocVerificacion.add(Creado());
        });
        return blocVerificacion;
      },
      child: const Aplicacion(),
    );
  }
}

class Aplicacion extends StatelessWidget {
  const Aplicacion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Builder(builder: (context) {
          var estado = context.watch<BlocVerificacion>().state;
          if (estado is Creandose) {
            return const VistaCreandose();
          }
          if (estado is SolicitandoNombre) {
            return const VistaEsperandoNombre();
          }
          return const Center(
              child: Text('Si estas viendo esto algo salio mal, HUYE'));
        }),
      ),
    );
  }
}
