import 'package:flutter/material.dart';
import 'package:flutter_la_garrita/config/menu/menu_items.dart';
import 'package:flutter_la_garrita/presentation/providers/theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = 'setting_screen';
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const Center(
        child: _SettingView(),
      ),
    );
  } 
}

class _SettingView extends ConsumerWidget {
  const _SettingView();

  @override
  Widget build(BuildContext context, ref) {
    final isColor = Theme.of(context).colorScheme;
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;
    return Column(
      children: [
        SwitchListTile(
          title: const Text('Imagen de fondo'),
          subtitle: isDarkMode
              ? const Text('Modo Oscuro Activado')
              : const Text('Modo Claro Activado'),
          value: isDarkMode,
          onChanged: (isDarkMode) {
            ref.watch(themeNotifierProvider.notifier).toggleDarkMode();
          },
          secondary: Icon(
            isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
            color: isColor.primary,
          ),
        ),
        const Expanded(
          child: _SettingItems(),
        ),
      ],
    );
  }
}

class _SettingItems extends StatelessWidget {
  const _SettingItems();

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
