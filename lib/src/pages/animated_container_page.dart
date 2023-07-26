import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({super.key});

  @override
  State<AnimatedContainerPage> createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOutExpo,
          width: _width,
          height: _height,
          decoration: BoxDecoration(color: _color, borderRadius: _borderRadius),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _cambiarForma(),
        child: const Icon(Icons.sports_martial_arts_rounded),
      ),
    );
  }

  _cambiarForma() {
    // _width = 50.0;
    // _height = 50.0;

    // numero ramdon de 0 a 5
    // var intValue = Random().nextInt(5) + 1;
    // var intValue = Random().nextInt(300).toDouble();

    if (kDebugMode) {
      // print('ramdon $intValue');
      print('heigth  = $_height');
      print('wigth = $_width');
    }

    // si el numero es negativo lo transforma en 1
    // if (intValue < 0) {
    //   intValue = 1;
    // }

    setState(() {
      // _height = _height * intValue;
      // _width = _height * intValue;
      _height = Random().nextInt(300).toDouble();
      _width = Random().nextInt(300).toDouble();
      // para el color se usa la propieda fromRGBO que recibe los colores int hasta 255
      _color = Color.fromRGBO(
        Random().nextInt(255),
        Random().nextInt(255),
        Random().nextInt(255),
        1,
      );
      // para el border hay que convertirlo a double
      _borderRadius = BorderRadius.circular(Random().nextInt(100).toDouble());
    });
  }
}
