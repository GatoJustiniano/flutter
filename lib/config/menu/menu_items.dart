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
