import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AlertPage'),
      ),
      body: Center(
        // boton
        child: TextButton(
          // estilo del boton
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            backgroundColor:
                const MaterialStatePropertyAll<Color>(Colors.blueAccent),
            elevation: MaterialStateProperty.all<double>(10.0),
            shadowColor:
                MaterialStatePropertyAll<Color>(Colors.purpleAccent.shade400),
            padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
                EdgeInsets.all(10)),
          ),
          // texto del boton
          child: const Text(
            'Mostrar Alerta',
            style: TextStyle(color: Colors.white),
          ),
          // funcion al pulsar
          onPressed: () => _mostrarAlerta(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back_sharp),
      ),
    );
  }

// alerta1
  void _mostrarAlerta(BuildContext context) {
    // alerta
    showDialog(
      context: (context),
      //barrierDismissible cierra alerta dardo click afuera si esta true
      // contenido de la alerta
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          // redondear bordes
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          // titulo de la alerta
          title: const Text('titulo'),
          // contenido de la alerta
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('este es el contenido de la caja de la alerta'),
              FlutterLogo(
                size: 100,
              ),
            ],
          ),
          // botones
          actions: [
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Ok'),
              onPressed: () {},
            ),
          ],
        );
      },
    );
  }
}
