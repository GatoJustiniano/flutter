import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const routeName = 'ui_controls_screen';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controles'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum typeTransport { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  typeTransport selectedTransport = typeTransport.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Modo desarrollador'),
          subtitle: const Text('Controles extras'),
          value: isDeveloper,
          onChanged: (value) => setState(() {
            isDeveloper = !isDeveloper;
          }),
        ),
        const SizedBox(height: 20),
        ExpansionTile(
          title: const Text('Tipo de transporte'),
          subtitle: Text('$selectedTransport'),
          children: [
            RadioListTile(
              title: const Text('Transporte Carro'),
              subtitle: const Text('type de transporte'),
              value: typeTransport.car,
              groupValue: selectedTransport,
              onChanged: (value) => setState(() {
                selectedTransport = typeTransport.car;
              }),
            ),
            RadioListTile(
              title: const Text('Transporte Bote'),
              subtitle: const Text('type de transporte'),
              value: typeTransport.boat,
              groupValue: selectedTransport,
              onChanged: (value) => setState(() {
                selectedTransport = typeTransport.boat;
              }),
            ),
            RadioListTile(
              title: const Text('Transporte Avión'),
              subtitle: const Text('type de transporte'),
              value: typeTransport.plane,
              groupValue: selectedTransport,
              onChanged: (value) => setState(() {
                selectedTransport = typeTransport.plane;
              }),
            ),
            RadioListTile(
              title: const Text('Transporte Submarino'),
              subtitle: const Text('type de transporte'),
              value: typeTransport.submarine,
              groupValue: selectedTransport,
              onChanged: (value) => setState(() {
                selectedTransport = typeTransport.submarine;
              }),
            ),
          ],
        ),
        const SizedBox(height: 20),
        CheckboxListTile(
          title: const Text('Desayuno'),
          subtitle: const Text('Incluir?'),
          value: wantsBreakfast,
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),
        ),
        CheckboxListTile(
          title: const Text('Almuerzo'),
          subtitle: const Text('Incluir?'),
          value: wantsLunch,
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          }),
        ),
        CheckboxListTile(
          title: const Text('Cena'),
          subtitle: const Text('Incluir?'),
          value: wantsDinner,
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
          }),
        ),
      ],
    );
  }
}
