import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
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

enum Trasportation { car, boat, plane, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Trasportation selectedTransportation = Trasportation.car;
  bool wantsBreakfast = false;
  bool wantsLunchfast = false;
  bool wantsDinnerfast = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
            title: const Text('Development mode'),
            subtitle: const Text('Controles adicionales para desarrollo'),
            value: isDeveloper,
            onChanged: (value) => setState(() {
                  isDeveloper = !isDeveloper;
                })),
        ExpansionTile(
          // #colapsado por defecto
          initiallyExpanded: true,
          title: const Text('Vehículo de transporte'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile(
                title: const Text('Car'),
                subtitle: const Text('Vehículo terrestre'),
                value: Trasportation.car,
                groupValue: selectedTransportation,
                onChanged: ((value) => setState(() {
                      selectedTransportation = value as Trasportation;
                    }))),
            RadioListTile(
                title: const Text('Boat'),
                subtitle: const Text('Vehículo acuático'),
                value: Trasportation.boat,
                groupValue: selectedTransportation,
                onChanged: ((value) => setState(() {
                      selectedTransportation = value as Trasportation;
                    }))),
            RadioListTile(
                title: const Text('Plane'),
                subtitle: const Text('Vehículo aéreo'),
                value: Trasportation.plane,
                groupValue: selectedTransportation,
                onChanged: ((value) => setState(() {
                      selectedTransportation = value as Trasportation;
                    }))),
            RadioListTile(
                title: const Text('Submarine'),
                subtitle: const Text('Vehículo submarino'),
                value: Trasportation.submarine,
                groupValue: selectedTransportation,
                onChanged: ((value) => setState(() {
                      selectedTransportation = value as Trasportation;
                    }))),
          ],
        ),
        CheckboxListTile(
          title: const Text('Incluir desayuno'),
          value: wantsBreakfast,
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),
        ),
        CheckboxListTile(
          title: const Text('Incluir almuerzo'),
          value: wantsLunchfast,
          onChanged: (value) => setState(() {
            wantsLunchfast = !wantsLunchfast;
          }),
        ),
        CheckboxListTile(
          title: const Text('Incluir cena'),
          value: wantsDinnerfast,
          onChanged: (value) => setState(() {
            wantsDinnerfast = !wantsDinnerfast;
          }),
        )
      ],
    );
  }
}
