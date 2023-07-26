import 'package:flutter/material.dart';

class SlidersPage extends StatefulWidget {
  const SlidersPage({super.key});

  @override
  State<SlidersPage> createState() => _SlidersPageState();
}

class _SlidersPageState extends State<SlidersPage> {
  double _valorSlider = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sliders'),
        ),
        body: Column(
          children: [
            _crearSlider(),
            _crearCheckBox(),
            _crearSwitch(),
            Expanded(
              child: _crearImagen(),
            ),
          ],
        ));
  }

  _crearSlider() {
    return Slider(
      value: _valorSlider,
      min: 10,
      max: 400,
      onChanged: _bloquearCheck
          ? null
          : (valor) {
              setState(() {
                _valorSlider = valor;
              });
            },
      activeColor: Colors.indigo,
      label: 'tamaño de la imagen: $_valorSlider',
      divisions: 20,
    );
  }

  Widget _crearCheckBox() {
    // --------checkbox1--------
    // return Checkbox(
    //   value: _bloquearCheck,
    //   onChanged: (valor) {
    //     setState(() {
    //       _bloquearCheck = valor!;
    //     });
    //   },
    // );

    return CheckboxListTile(
      title: const Text('bloquear Slider'),
      activeColor: Colors.purple,
      value: _bloquearCheck,
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor!;
        });
      },
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      activeColor: Colors.purple,
      title: const Text('bloquear Slider'),
      value: _bloquearCheck,
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );
  }

  Widget _crearImagen() {
    return Image(
      image: const NetworkImage(
          'https://steamuserimages-a.akamaihd.net/ugc/871874599751199095/8FC99010EE0B683476A25F73EEA7A36281AD37F2/?imw=5000&imh=5000&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=false'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }
}
