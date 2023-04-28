import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const String name = 'ui_controls_screen';

  const UiControlsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
        centerTitle: true,
      ),
      body: _UiControlsView(),
    );
  }
}

//---------------------------------------------------

enum Transportation { car, plane, boat, submarine }

enum Sex { masculino, femenino }

class _UiControlsView extends StatefulWidget {
  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

class _UiControlsViewState extends State<_UiControlsView> {
  //-------------------------------------------------
  //------------------ Variables --------------------
  //-------------------------------------------------
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  Sex selectedTSex = Sex.masculino;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  //-------------------------------------------------
  //------------------ Pantalla ---------------------
  //-------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        const Divider(
          color: Colors.black,
        ),
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Controles adicionales'),
          value: isDeveloper,
          onChanged: (value) {
            isDeveloper = !isDeveloper;
            setState(() {});
          },
        ),
        const Divider(
          color: Colors.black,
        ),
        ExpansionTile(
          title: const Text('Vehículo de transporte'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile(
              title: const Text('By Car'),
              subtitle: const Text('Viajar por carro'),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.car;
              }),
            ),
            RadioListTile(
              title: const Text('By Plane'),
              subtitle: const Text('Viajar por avión'),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.plane;
              }),
            ),
            RadioListTile(
              title: const Text('By Boat'),
              subtitle: const Text('Viajar por barco'),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.boat;
              }),
            ),
            RadioListTile(
              title: const Text('By Submarine'),
              subtitle: const Text('Viajar por submarino'),
              value: Transportation.submarine,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.submarine;
              }),
            ),
          ],
        ),
        const Divider(
          color: Colors.black,
        ),
        Row(
          children: [
            Expanded(
              child: RadioListTile(
                title: const Text('Masculino'),
                value: Sex.masculino,
                groupValue: selectedTSex,
                onChanged: (value) => setState(() {
                  selectedTSex = Sex.masculino;
                }),
              ),
            ),
            Expanded(
              child: RadioListTile(
                title: const Text('Femenino'),
                value: Sex.femenino,
                groupValue: selectedTSex,
                onChanged: (value) => setState(() {
                  selectedTSex = Sex.femenino;
                }),
              ),
            ),
          ],
        ),
        const Divider(
          color: Colors.black,
        ),
        CheckboxListTile(
            title: const Text('Quiere desayuno?'),
            value: wantsBreakfast,
            onChanged: (value) => setState(() {
                  wantsBreakfast = !wantsBreakfast;
                })),
        CheckboxListTile(
            title: const Text('Quiere almuerzo?'),
            value: wantsLunch,
            onChanged: (value) => setState(() {
                  wantsLunch = !wantsLunch;
                })),
        CheckboxListTile(
            title: const Text('Quiere cena?'),
            value: wantsDinner,
            onChanged: (value) => setState(() {
                  wantsDinner = !wantsDinner;
                })),
      ],
    );
  }
}
