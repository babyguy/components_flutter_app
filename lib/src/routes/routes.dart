import 'package:componentes/src/pages/animated_container_page.dart';
import 'package:componentes/src/pages/home_page.dart';
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/card_pages.dart';
import 'package:componentes/src/pages/input_pager.dart';
import 'package:componentes/src/pages/listview_page.dart';
import 'package:componentes/src/pages/slider_page.dart';

import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplivationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => const HomePage(),
    'alert': (BuildContext context) => const AlertPage(),
    'avatar': (BuildContext context) => const AvatarPage(),
    'card': (BuildContext context) => const CardPage(),
    'animartedContainer': (BuildContext context) =>
        const AnimatedContainerPage(),
    'inputs': (BuildContext context) => const InputPage(),
    'slider': (BuildContext context) => const SlidersPage(),
    'list': (BuildContext context) => const ListaPage(),
  };
}
