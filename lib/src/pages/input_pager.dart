import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String nombre = '';
  String email = '';
  String fecha = '';
  String _opcion = 'Volar';

  final List<String> _poderes = [
    'Volar',
    'Rayos X',
    'Super Aliento',
    'Super Fuerza'
  ];

  final TextEditingController _inputFieldDteController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('inputs'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 20.0,
        ),
        children: [
          _crearInput(),
          const Divider(),
          _crearEmail(),
          const Divider(),
          _crearPassword(),
          const Divider(),
          _crearFecha(context),
          const Divider(),
          _crearDopdown(),
          const Divider(),
          _crearOPersona(),
          const Divider(),
        ],
      ),
    );
  }

  // Name
  _crearInput() {
    return TextField(
        // autofocus: true,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          counter: const Text('letras 0'),
          hintText: 'Nombre',
          labelText: 'nombre',
          helperText: 'solo es el nombre',
          suffixIcon: const Icon(Icons.accessibility),
          icon: const Icon(Icons.account_circle),
        ),
        onChanged: (value) {
          setState(() {
            nombre = value;
          });
        });
  }

  // Email
  _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: const Text('letras 0'),
        hintText: 'Email',
        labelText: 'emial',
        suffixIcon: const Icon(Icons.alternate_email),
        icon: const Icon(Icons.email),
      ),
      onChanged: (value) => setState(() {
        email = value;
      }),
    );
  }

  // password
  _crearPassword() {
    return TextField(
      // ocultar el texto del input
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: const Text('letras 0'),
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: const Icon(Icons.lock_open),
        icon: const Icon(Icons.lock),
      ),
    );
  }

  // Date
  _crearFecha(BuildContext context) {
    return TextField(
      controller: _inputFieldDteController,
      // no poder escribir direcrtamente en el input
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: const Text('letras 0'),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        suffixIcon: const Icon(Icons.calendar_today),
        icon: const Icon(Icons.calendar_month_outlined),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selecDate(context);
      },
    );
  }

// calendario para el DATE
  _selecDate(BuildContext context) async {
    DateTime? pick = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      // año de inicio en el calendario a mostrar
      firstDate: DateTime(1900),
      // año de final en el calendario a mostrar
      lastDate: DateTime.now(),
      // formato de idioma automatizado al español
      locale: const Locale('es', 'ES'),
    );
    if (pick != null) {
      setState(() {
        fecha = pick.toString();
        _inputFieldDteController.text = fecha;
      });
    }
  }

// lista de dropDown
  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    // growable false list 0, and growable true list increment
    List<DropdownMenuItem<String>> lista = List.empty(growable: true);
    for (var poder in _poderes) {
      lista.add(
        DropdownMenuItem(
          value: poder,
          child: Text(poder),
        ),
      );
    }
    return lista;
  }

  // dropDown
  _crearDopdown() {
    return Row(
      children: [
        const Icon(Icons.select_all),
        const SizedBox(width: 30.0),
        DropdownButton(
          value: _opcion,
          items: getOpcionesDropdown(),
          onChanged: (opt) {
            setState(() {
              _opcion = opt.toString();
            });
          },
        ),
      ],
    );
  }

  // Info
  _crearOPersona() {
    return ListTile(
      title: Text('el nombre es : $nombre'),
      subtitle: Text('el Email es : $email'),
      trailing: Text(_opcion),
    );
  }
}
