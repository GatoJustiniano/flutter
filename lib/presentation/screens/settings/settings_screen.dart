import 'package:flutter/material.dart';
import 'package:flutter_la_garrita/config/menu/menu_items.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = 'setting_screen';
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: _SettingView(),
      ),
    );
  }
}

class _SettingView extends StatelessWidget {
  const _SettingView();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchListTile(
          title: Text('Modo desarrollador'),
          subtitle: Text('Controles extras'),
          value: true,
          onChanged: (value) {},
        ),
        Expanded(
          child: _GenerarSettingItems(),
        ),
      ],
    );
  }
}

class _GenerarSettingItems extends StatelessWidget {
  const _GenerarSettingItems();

  @override
  Widget build(BuildContext context) {
    final isColor = Theme.of(context).colorScheme;
    return ListView.builder(
      itemCount: appMenuSettingItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuSettingItems[index];
        return ListTile(
          leading: Icon(
            menuItem.icon,
            color: isColor.primary,
          ),
          title: Text(menuItem.title),
          subtitle: Text(menuItem.subTitle),
          onTap: () {
            context.push(menuItem.link);
          },
        );
      },
    );
  }
}
