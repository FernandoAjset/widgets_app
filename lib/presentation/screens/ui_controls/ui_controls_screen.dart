import 'package:flutter/foundation.dart';
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
      body: const _UiControlsView(),
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
        _DeveloperModeSwitch(isDeveloper, (value) {
          setState(() {
            isDeveloper = value;
          });
        }),
        _TransportationTile(selectedTransportation, (value) {
          setState(() {
            if (value != null) {
              selectedTransportation = value;
            }
          });
        }),
        _MealCheckbox('Incluir desayuno', wantsBreakfast, (value) {
          setState(() {
            if (value != null) {
              wantsBreakfast = value;
            }
          });
        }),
        _MealCheckbox('Incluir almuerzo', wantsLunchfast, (value) {
          setState(() {
            if (value != null) {
              wantsLunchfast = value;
            }
          });
        }),
        _MealCheckbox('Incluir cena', wantsDinnerfast, (value) {
          setState(() {
            if (value != null) {
              wantsDinnerfast = value;
            }
          });
        }),
      ],
    );
  }
}

class _DeveloperModeSwitch extends StatelessWidget {
  final bool isDeveloper;
  final ValueChanged<bool> onChanged;

  const _DeveloperModeSwitch(this.isDeveloper, this.onChanged);

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const Text('Cliente VIP'),
      subtitle: const Text('Controles adicionales para cliente VIP'),
      value: isDeveloper,
      onChanged: onChanged,
    );
  }
}

class _TransportationTile extends StatelessWidget {
  final Trasportation selectedTransportation;
  final ValueChanged<Trasportation?> onChanged;

  const _TransportationTile(this.selectedTransportation, this.onChanged);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: true,
      title: const Text('Vehículo de transporte'),
      subtitle: Text('$selectedTransportation'),
      children: Trasportation.values.map((transport) {
        return RadioListTile(
          title: Text(describeEnum(transport)),
          value: transport,
          groupValue: selectedTransportation,
          onChanged: onChanged,
        );
      }).toList(),
    );
  }
}

class _MealCheckbox extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool?> onChanged;

  const _MealCheckbox(this.title, this.value, this.onChanged);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
    );
  }
}
