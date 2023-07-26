import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  // lista
  List<dynamic> opcioines = [];

  // constructor
  _MenuProvider() {
    cargarData();
  }

  // cargar json
  Future<List<dynamic>> cargarData() async {
    // ----------hace la consulta del json y la almacena en resp
    // se ahce tipo async para que espere la consulta el tiempo necesario----------,
    String resp = await rootBundle.loadString('data/menu_opts.json');
    // ----------mapea resp para acceder a la informacion----------
    Map<String, dynamic> dataMap = json.decode(resp);
    // se asigna la resp a opciones
    opcioines = dataMap['rutas'];
    return opcioines;
  }
}

final menuProvider = _MenuProvider();
