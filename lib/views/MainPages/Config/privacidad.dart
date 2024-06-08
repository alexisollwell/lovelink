import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/configModels/privacidadModel.dart';

class PrivacyScreen extends StatefulWidget {
  final Privacidad? initialValues;

  const PrivacyScreen({Key? key, this.initialValues}) : super(key: key);

  @override
  _PrivacyScreenState createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  late Privacidad privacidad;

  @override
  void initState() {
    super.initState();
    privacidad = widget.initialValues ?? Privacidad();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundNav,
      appBar: AppBar(
        title: Text('Privacidad'),
        backgroundColor: const Color(0xffffa31a)
      ),
      body: ListView(
        children: [
          buildSwitchListTile(
            title: 'Visibilidad del Perfil',
            value: privacidad.visibilidadPerfil,
            onChanged: (value) {
              setState(() {
                privacidad.toggleVisibilidadPerfil();
              });
            },
          ),
          buildSwitchListTile(
            title: 'Compartir Datos',
            value: privacidad.compartirDatos,
            onChanged: (value) {
              setState(() {
                privacidad.toggleCompartirDatos();
              });
            },
          ),
          buildSwitchListTile(
            title: 'Personalización de Anuncios',
            value: privacidad.personalizacionAnuncios,
            onChanged: (value) {
              setState(() {
                privacidad.togglePersonalizacionAnuncios();
              });
            },
          ),
        ],
      ),
    );
  }

  SwitchListTile buildSwitchListTile({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      activeColor: Color(0xffffa31a),
      title: Text(title, style: TextStyle(color: Colors.white)),
      value: value,
      onChanged: onChanged,
    );
  }
}
