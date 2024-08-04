import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const routeName = 'ui_controls_screen';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UI Controles'),
      ),
      body: _UiControlsView(),
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
      physics: ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: Text('Modo desarrollador'),
          subtitle: Text('Controles extras'),
          value: isDeveloper,
          onChanged: (value) => setState(() {
            isDeveloper = !isDeveloper;
          }),
        ),
        SizedBox(height: 20),
        ExpansionTile(
          title: Text('Tipo de transporte'),
          subtitle: Text('$selectedTransport'),
          children: [
            RadioListTile(
              title: Text('Transporte Carro'),
              subtitle: Text('type de transporte'),
              value: typeTransport.car,
              groupValue: selectedTransport,
              onChanged: (value) => setState(() {
                selectedTransport = typeTransport.car;
              }),
            ),
            RadioListTile(
              title: Text('Transporte Bote'),
              subtitle: Text('type de transporte'),
              value: typeTransport.boat,
              groupValue: selectedTransport,
              onChanged: (value) => setState(() {
                selectedTransport = typeTransport.boat;
              }),
            ),
            RadioListTile(
              title: Text('Transporte Avión'),
              subtitle: Text('type de transporte'),
              value: typeTransport.plane,
              groupValue: selectedTransport,
              onChanged: (value) => setState(() {
                selectedTransport = typeTransport.plane;
              }),
            ),
            RadioListTile(
              title: Text('Transporte Submarino'),
              subtitle: Text('type de transporte'),
              value: typeTransport.submarine,
              groupValue: selectedTransport,
              onChanged: (value) => setState(() {
                selectedTransport = typeTransport.submarine;
              }),
            ),
          ],
        ),
        SizedBox(height: 20),
        CheckboxListTile(
          title: Text('Desayuno'),
          subtitle: Text('Incluir?'),
          value: wantsBreakfast,
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),
        ),
        CheckboxListTile(
          title: Text('Almuerzo'),
          subtitle: Text('Incluir?'),
          value: wantsLunch,
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          }),
        ),
        CheckboxListTile(
          title: Text('Cena'),
          subtitle: Text('Incluir?'),
          value: wantsDinner,
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
          }),
        ),
      ],
    );
  }
}
