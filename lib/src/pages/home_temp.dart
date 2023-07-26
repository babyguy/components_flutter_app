import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  HomePageTemp({super.key});

  final opciones = [
    'uno',
    'dos',
    'tres',
    'cuatro',
    'cinco',
    'seis',
    'siete',
    'ocho',
    'nueve',
    'diez'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes temp'),
      ),
      body: ListView(
        children: _crearItemsCorta(),
      ),
    );
  }
//  -------------------------se cambio por _crearItemsCorta-------------------------
  // List<Widget> _crearItems() {
  //   List<Widget> lista = [];

  //   for (String opt in opciones) {
  //     final tempWidget = ListTile(
  //       title: Text(opt),
  //     );

  //     // -----metodo normal-----
  //     // lista.add(tempWidget);
  //     // lista.add(const Divider());

  //     // -----metodo cascada-----
  //     lista
  //       ..add(tempWidget)
  //       ..add(const Divider());
  //   }

  //   return lista;
  // }|

  List<Widget> _crearItemsCorta() {
    return opciones.map((item) {
      return Column(
        children: [
          ListTile(
            // informacuion del list title
            title: Text('${item.toUpperCase()}!'),
            subtitle: const Text('como va prro'),
            // icono al inicio
            leading: const Icon(Icons.person),
            // icono al final
            trailing: const Icon(Icons.arrow_right_outlined),
          ),
          const Divider(),
        ],
      );
    }).toList();
    // return widgets;
  }
}
