import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Botones',
      subTitle: 'botones de flutter',
      link: '/buttons',
      icon: Icons.smart_button_outlined),
  MenuItem(
      title: 'Tarjetas',
      subTitle: 'Contenedor de tarjetas',
      link: '/cards',
      icon: Icons.credit_card),
  MenuItem(
      title: 'Otros',
      subTitle: 'Contenedor de pantallas ajenas',
      link: '/others',
      icon: Icons.outbox_rounded),
  MenuItem(
      title: 'Setting',
      subTitle: 'Configuraciones',
      link: '/settings',
      icon: Icons.settings),
];

const appMenuWidgetsItems = <MenuItem>[
  MenuItem(
      title: 'Counters',
      subTitle: 'pantalla de counte',
      link: '/counters',
      icon: Icons.smart_button_outlined),
  MenuItem(
      title: 'Counters Riverpood',
      subTitle: 'pantalla realizada con el provider Riverpood',
      link: '/counters_riverpood',
      icon: Icons.smart_button_rounded),
  MenuItem(
      title: 'Progress Indicators',
      subTitle: 'Generales y controlados',
      link: '/progress',
      icon: Icons.refresh_rounded),
  MenuItem(
      title: 'Snackbars y diálogos',
      subTitle: 'Indicadores en pantalla',
      link: '/snackbars',
      icon: Icons.info_outline),
  MenuItem(
      title: 'Animated container',
      subTitle: 'Stateful widget animado',
      link: '/animated',
      icon: Icons.check_box_outline_blank_rounded),
  MenuItem(
      title: 'UI Controls + Tiles',
      subTitle: 'Una serie de controles de Flutter',
      link: '/ui-controls',
      icon: Icons.car_rental_outlined),
  MenuItem(
      title: 'Introducción a la aplicación',
      subTitle: 'Pequeño tutorial introductorio',
      link: '/tutorial',
      icon: Icons.accessible_rounded),
  MenuItem(
      title: 'InfiniteScroll y Pull',
      subTitle: 'Listas infinitas y pull to refresh',
      link: '/infinite',
      icon: Icons.list_alt_rounded),
];
