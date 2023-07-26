import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  const ListaPage({super.key});

  @override
  State<ListaPage> createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  // controlador de scroll
  final ScrollController _scrollController = ScrollController();

// lista de vacia para las imagenes
  final List<int> _listaNUmeros = [];
  // numero de imagenes
  int _uiltimoItem = 0;
  // indica si carga mas imagenes
  bool _isloading = false;

// inicializa una funcion o metodo cuando abre la pagina
  @override
  void initState() {
    super.initState();
    _agregar10();
    _scrollController.addListener(() {
      // si la pósicionm en pixeles es la maxima entonces agregar10
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _agregar10();
        fetchData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Listas'),
        ),
        body: Stack(
          children: [
            _crearLista(),
            _crearLoading(),
          ],
        ));
  }

// crear lista
  Widget _crearLista() {
    return RefreshIndicator(
      // se pasa la referencia al metodo mas no su ejecucion por eso no lleva ()
      onRefresh: obtenerPagina1,
      child: ListView.builder(
        // controlador para el scroll
        controller: _scrollController,
        itemCount: _listaNUmeros.length,
        itemBuilder: (BuildContext context, int index) {
          final imagen = _listaNUmeros[index];
          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300/?image=$imagen'),
            placeholder: const AssetImage('assets/jar-loading.gif'),
          );
        },
      ),
    );
  }

  Future obtenerPagina1() async {
    const duration = Duration(seconds: 2);
    Timer(duration, () {
      // limpiar la lista
      _listaNUmeros.clear();
      // aumentar en 1 el ultimo numero
      _uiltimoItem++;
      // agregar 10 imagenes
      _agregar10();
    });
    return Future.delayed(duration);
  }

// recorre las veces indicadas y las agrega a la lista
  void _agregar10() {
    for (var i = 1; i < 10; i++) {
      _uiltimoItem++;
      _listaNUmeros.add(_uiltimoItem);
    }
    // redibuja
    setState(() {});
  }

// da una pausa dxe 2 segundos
  Future fetchData() async {
    _isloading = true;
    setState(() {});

    const duration = Duration(seconds: 2);
    Timer(duration, responseHttp);
  }

// agrega los 10
  void responseHttp() {
    _isloading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 500),
    );
    _agregar10();
  }

// cuando la pagina es destruida se ejecuta
  @override
  void dispose() {
    super.dispose();
    // elimina de la memoria lo que carg
    _scrollController.dispose();
  }

  Widget _crearLoading() {
    if (_isloading) {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
