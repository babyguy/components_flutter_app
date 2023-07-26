import 'package:componentes/src/utils/icono_string_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:componentes/src/providers/menu_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes'),
        centerTitle: true,
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    // menuProvider.cargarData();

    return FutureBuilder(
      // ----------se enlaza  con el Future cargarData----------
      future: menuProvider.cargarData(),
      // ----------informacion por defecto mientras se carga la informacion del Future----------
      initialData: const [],
      // ----------muestra la informacion recibida en el future:----------
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (kDebugMode) {
          print('informacion de future:');
          print(snapshot.data);
        }

        return ListView(
          children: _crearListaItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _crearListaItems(data, BuildContext context) {
    // ----------variable para almacenar la data----------
    final List<Widget> opciones = [];

    // ----------leer data----------
    data.forEach((opt) {
      // ----------widget para mostrar la data----------
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: const Icon(
          Icons.keyboard_arrow_right,
          color: Colors.blue,
        ),
        onTap: () {
          // ----------navegar a otra pagina----------
          // final route =
          //     MaterialPageRoute(builder: (context) => const AlertPage());
          // Navigator.push(context, route);

          Navigator.pushNamed(context, opt['ruta']);
        },
      );
      opciones
        ..add(widgetTemp)
        ..add(const Divider());
    });
    return opciones;
  }
}
