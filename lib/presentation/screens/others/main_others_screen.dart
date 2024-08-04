import 'package:flutter/material.dart';
import 'package:flutter_la_garrita/config/menu/menu_items.dart';
import 'package:go_router/go_router.dart';

class MainOthersScreen extends StatelessWidget {
  static const routeName = 'others';

  const MainOthersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Otras pantallas con funciones'),
        ),
        body: const _HomeView());
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuWidgetsItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuWidgetsItems[index];
        return _CustomListTile(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final isColor = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(
        menuItem.icon,
        color: isColor.primary,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: isColor.primary,
      ),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      onTap: () {
        context.push(menuItem.link);
      },
    );
  }
}
