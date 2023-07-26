// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          _cardTipo1(),
          const SizedBox(height: 20),
          _cardTipo2(),
          const SizedBox(height: 20),
          _cardTipo1(),
          const SizedBox(height: 20),
          _cardTipo2(),
          const SizedBox(height: 20),
          _cardTipo1(),
          const SizedBox(height: 20),
          _cardTipo2(),
          const SizedBox(height: 20),
          _cardTipo1(),
          const SizedBox(height: 20),
          _cardTipo2(),
          const SizedBox(height: 20),
          _cardTipo1(),
          const SizedBox(height: 20),
          _cardTipo2(),
          const SizedBox(height: 20),
          _cardTipo1(),
          const SizedBox(height: 20),
          _cardTipo2(),
          const SizedBox(height: 20),
          _cardTipo1(),
          const SizedBox(height: 20),
          _cardTipo2(),
          const SizedBox(height: 20),
          _cardTipo1(),
          const SizedBox(height: 20),
          _cardTipo2(),
          const SizedBox(height: 20),
          _cardTipo1(),
          const SizedBox(height: 20),
          _cardTipo2(),
          const SizedBox(height: 20),
          _cardTipo1(),
          const SizedBox(height: 20),
          _cardTipo2(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

// ---------primera tarjeta---------
  Widget _cardTipo1() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          const ListTile(
            leading: Icon(
              Icons.photo_album,
              color: Colors.blue,
            ),
            title: Text('Titulo : Tarjeta Tipo 1'),
            subtitle: Text('subtitulo :  Subtitulo de la tarjete tipo 1'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: const Text('Cancelar'),
                onPressed: () {},
              ),
              TextButton(
                child: const Text('ok'),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }

// ---------segunda tarjeta---------
  Widget _cardTipo2() {
    // ---------se crea una columna para hacer el contenido de la tarjeta---------
    final card = Column(
      children: [
        // ---------mostrar una imagen mientras carga la real en la app---------
        const FadeInImage(
          // ---------imagen real de la app---------
          image: NetworkImage('https://wallpaperaccess.com/full/277110.jpg'),

          // ---------imagen de carga mientras aparece la real---------
          placeholder: AssetImage('assets/jar-loading.gif'),

          // ---------tiempos de entrada y salida de la imagen de carga---------
          fadeInDuration: Duration(milliseconds: 200),
          fadeOutDuration: Duration(milliseconds: 200),

          // ---------tamaño de imagen---------
          height: 300,
          fit: BoxFit.cover,
        ),

        // const Image(
        //   image: NetworkImage(
        //       'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/6ee9cd3c-dbb2-4d00-91f5-933fdc29ddcf/dfn6kz9-e98070e6-7298-4148-bfe0-740548be1095.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzZlZTljZDNjLWRiYjItNGQwMC05MWY1LTkzM2ZkYzI5ZGRjZlwvZGZuNmt6OS1lOTgwNzBlNi03Mjk4LTQxNDgtYmZlMC03NDA1NDhiZTEwOTUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.9X-9ahG2h8YImkjx8haWNCQe2tSa5OpOIA0dR2QjlrU'),
        // ),

        // ---------un container para dar la descripcionnde la imagen---------
        Container(
          padding: const EdgeInsets.all(10.0),
          child: const Text('Los lideres de WOW!'),
        ),
      ],
    );

    // ---------se retorna un container cuyo hijo es la columna creada anterior mente---------
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          // ---------bordes del contenedor---------
          borderRadius: BorderRadius.circular(30.0),

          // ---------sombra del contenedor---------
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(2.0, 10.0)),
          ]),

      // ---------el ClipRRect corta cualquien cosa que este fuera del contenedor ---------
      child: ClipRRect(
        // ---------el ClipRRect no puede tener el border en null por eso se agregfa nuevamente---------
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }
}
