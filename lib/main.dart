import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/routes/routes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      debugShowCheckedModeBanner: false,

      // flutter localization
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'), // English
        Locale('es', 'ES'), // Spanish
      ],

      // -----------solo una ruta-----------
      // home: HomePage(),

      // -----------lista de rutas-----------
      // routes: <String, WidgetBuilder>{
      //   '/': (BuildContext context) => const HomePage(),
      //   'alert': (BuildContext context) => const AlertPage(),
      //   'avatar': (BuildContext context) => const AvatarPage(),
      // },

      // -----------las rutas se pueden configurar en un archivo independiente-----------
      routes: getApplivationRoutes(),

      // -----------ruta inicial de lña lista de rutas-----------
      initialRoute: '/',

      // -----------si la ruta no existe o no esta definida se redirige a onGenerateRoute-----------
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) => const AlertPage(),
        );
      },
    );
  }
}
