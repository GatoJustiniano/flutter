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
      link: '/button',
      icon: Icons.smart_button_outlined),
  MenuItem(
      title: 'Tarjetas',
      subTitle: 'Contenedor de tarjetas',
      link: '/card',
      icon: Icons.credit_card),
  MenuItem(
      title: 'Setting',
      subTitle: 'Configuraciones',
      link: '/setting',
      icon: Icons.settings),
];
