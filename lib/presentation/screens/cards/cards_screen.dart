import 'package:flutter/material.dart';

const listCard = <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Elevación 0'},
  {'elevation': 1.0, 'label': 'Elevación 1'},
  {'elevation': 2.0, 'label': 'Elevación 2'},
  {'elevation': 3.0, 'label': 'Elevación 3'},
  {'elevation': 4.0, 'label': 'Elevación 4'},
  {'elevation': 5.0, 'label': 'Elevación 5'},
];

class CardsScreen extends StatelessWidget {
  static const routeName = 'cards_screen';
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: _CardView(),
    );
  }
}

class _CardView extends StatelessWidget {
  const _CardView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...listCard.map((card) =>
              _CardType1(label: card['label'], elevation: card['elevation'])),
          ...listCard.map((card) =>
              _CardType2(label: card['label'], elevation: card['elevation'])),
        ],
      ),
    );
  }
}

// card normal
class _CardType1 extends StatelessWidget {
  final String label;
  final double elevation;
  const _CardType1({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.battery_unknown),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}

// card border
class _CardType2 extends StatelessWidget {
  final String label;
  final double elevation;
  const _CardType2({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        side: BorderSide(
          color: colors.outline,
        )
      ),
      elevation: elevation,
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.battery_unknown),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - outline'),
            ),
          ],
        ),
      ),
    );
  }
}
