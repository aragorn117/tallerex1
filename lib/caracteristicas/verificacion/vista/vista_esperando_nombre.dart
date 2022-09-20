import 'package:flutter/material.dart';

class VistaEsperandoNombre extends StatelessWidget {
  const VistaEsperandoNombre({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Dame el nombre'),
        const TextField(),
        TextButton(onPressed: () {}, child: const Text('Algo debe decir aqui'))
      ],
    );
  }
}
